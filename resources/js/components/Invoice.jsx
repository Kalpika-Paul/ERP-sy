import React, { useEffect, useRef, useState } from "react";
import { useParams } from "react-router-dom";
import { Button, Spinner } from "react-bootstrap";
import { useReactToPrint } from "react-to-print";
import jsPDF from "jspdf";
import html2canvas from "html2canvas";
import axios from "axios";
import InvoicePrint from "../components/InvoicePrint";

export default function Invoice() {
  const { id } = useParams();
  const [sale, setSale] = useState(null);
  const invoiceRef = useRef(null);
  const token = localStorage.getItem("token");

  useEffect(() => {
    fetchSale();
  }, [id]);

  const fetchSale = async () => {
    try {
      const res = await axios.get(
        `${import.meta.env.VITE_API_URL}/api/sale/${id}`,
        {
          headers: { Authorization: `Bearer ${token}` },
        }
      );

      const data = res.data;

      const mappedSale = {
        ...data,
        cart: data.items.map((item) => ({
          model: item.product_name,
          brand: item.brand || "-",
          variant: item.variant,
          ram: item.ram,
          rom: item.rom,
          color: item.color,
          imei: item.imei,
          quantity: item.quantity,
          subtotal: item.subtotal,
        })),
      };

      setSale(mappedSale);
    } catch (err) {
      console.error(err);
    }
  };

  const handlePrint = useReactToPrint({
    contentRef: invoiceRef,
    documentTitle: `Eastern_Mobile_Inv_${sale?.invoice_code}`,
  });

  const downloadPDF = async () => {
    if (!invoiceRef.current) return;

    
    await new Promise((resolve) => setTimeout(resolve, 500));

    const canvas = await html2canvas(invoiceRef.current, {
      scale: 2,
      useCORS: true,
      scrollY: -window.scrollY,
    });

    const imgData = canvas.toDataURL("image/png");

    const pdf = new jsPDF("p", "mm", "a4");

    const width = pdf.internal.pageSize.getWidth();
    const height = (canvas.height * width) / canvas.width;

    pdf.addImage(imgData, "PNG", 0, 0, width, height);
    pdf.save(`Invoice_${sale?.invoice_code}.pdf`);
  };

  if (!sale)
    return (
      <div
        className="d-flex justify-content-center align-items-center"
        style={{ height: "100vh" }}
      >
        <Spinner animation="grow" variant="success" />
      </div>
    );

  return (
    <div
      style={{
        backgroundColor: "#f0f4f2",
        minHeight: "100vh",
        padding: "40px 0",
      }}
    >
      <div className="container" style={{ maxWidth: "900px" }}>
  
        <div className="d-flex justify-content-between align-items-center mb-4 no-print">
          <h4 className="fw-bold mb-0">Invoice Management</h4>

          <div className="d-flex gap-3">
            <Button
              onClick={handlePrint}
              style={{
                background: "#2d4a3e",
                border: "none",
                borderRadius: "8px",
              }}
            >
              Print
            </Button>

            <Button onClick={downloadPDF} variant="outline-dark">
              Download PDF
            </Button>
          </div>
        </div>

        <div ref={invoiceRef} className="bg-white shadow-lg rounded-4">
          <InvoicePrint sale={sale} />
        </div>
      </div>

      <style>{`
        @media print {
          .no-print { display: none !important; }
          body { background: white !important; }
          .shadow-lg { box-shadow: none !important; }
        }
      `}</style>
    </div>
  );
}