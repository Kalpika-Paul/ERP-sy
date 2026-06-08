import React, { useState, useEffect } from "react";
import { Table, Button, Form, Row, Col } from "react-bootstrap";
import axios from "axios";
import * as XLSX from "xlsx";
import { saveAs } from "file-saver";
import { FaDownload } from "react-icons/fa";

export default function ProfitReport() {
  const [data, setData] = useState([]);
  const [filteredData, setFilteredData] = useState([]);

  const [totalProfit, setTotalProfit] = useState(0);
  const [totalPurchase, setTotalPurchase] = useState(0);
  const [totalSale, setTotalSale] = useState(0);

  const [search, setSearch] = useState("");
  const [productFilter, setProductFilter] = useState("");
  const [fromDate, setFromDate] = useState("");
  const [toDate, setToDate] = useState("");

  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 20;

  const token = localStorage.getItem("token");

  useEffect(() => {
    document.title = "Profit Report";
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const res = await axios.get(
        `${import.meta.env.VITE_API_URL}/api/profit-report`,
        {
          headers: { Authorization: `Bearer ${token}` },
        }
      );

      const apiData = res.data.data || [];

      setData(apiData);
      setFilteredData(apiData);

  
      setTotalProfit(Number(res.data.total_profit || 0));
      setTotalPurchase(Number(res.data.total_purchase || 0));
      setTotalSale(Number(res.data.total_sale || 0));

    } catch (err) {
      console.error(err);
      alert("Failed to load profit data");
    }
  };

  useEffect(() => {
    let temp = [...data];

    if (search) {
      temp = temp.filter((item) =>
        item.product_name?.toLowerCase().includes(search.toLowerCase())
      );
    }

    if (productFilter) {
      temp = temp.filter((item) => item.product_name === productFilter);
    }

    if (fromDate) {
      temp = temp.filter((item) => item.date >= fromDate);
    }

    if (toDate) {
      temp = temp.filter((item) => item.date <= toDate);
    }

    setFilteredData(temp);
    setCurrentPage(1);
  }, [search, productFilter, fromDate, toDate, data]);

  const indexOfLast = currentPage * itemsPerPage;
  const indexOfFirst = indexOfLast - itemsPerPage;
  const currentData = filteredData.slice(indexOfFirst, indexOfLast);

  const pageTotalPurchase = currentData.reduce(
    (sum, i) => sum + Number(i.purchase_price || 0),
    0
  );

  const pageTotalSale = currentData.reduce(
    (sum, i) => sum + Number(i.sale_price || 0),
    0
  );

  const pageTotalProfit = currentData.reduce(
    (sum, i) => sum + Number(i.profit || 0),
    0
  );

  const exportToExcel = () => {
    const excelData = filteredData.map((item, index) => ({
      SL: index + 1,
      Product: item.product_name,
      Brand: item.brand,
      Color: item.color,
      RAM: item.ram,
      ROM: item.rom,
      Purchase: item.purchase_price,
      Sale: item.sale_price,
      Profit: item.profit,
      Date: item.date,
    }));

    const worksheet = XLSX.utils.json_to_sheet(excelData);
    const workbook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(workbook, worksheet, "Profit Report");

    const buffer = XLSX.write(workbook, {
      bookType: "xlsx",
      type: "array",
    });

    saveAs(new Blob([buffer]), "profit-report.xlsx");
  };

  return (
    <div className="container-fluid px-3">

   
      <div
        className="d-flex flex-column flex-md-row justify-content-between align-items-center mb-4 p-3 p-md-4 rounded-4 shadow-sm"
        style={{
          background: "linear-gradient(135deg, #01753b, #03a65a)",
          color: "#fff",
        }}
      >
        <div className="text-center text-md-start mb-3 mb-md-0">
          <h3 className="fw-bold mb-1">👨‍💼 Profit Report</h3>
          <small>See supplier details</small>
        </div>

        <Button variant="light" onClick={exportToExcel} className="fw-semibold">
          <FaDownload className="me-2" /> Download Excel
        </Button>
      </div>

  
      <Row className="mb-3">
        <Col md={6}>
          <Form.Control
            placeholder="Search product..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
          />
        </Col>

        <Col md={3}>
          <Form.Control
            type="date"
            value={fromDate}
            onChange={(e) => setFromDate(e.target.value)}
          />
        </Col>

        <Col md={3}>
          <Form.Control
            type="date"
            value={toDate}
            onChange={(e) => setToDate(e.target.value)}
          />
        </Col>
      </Row>

    
      <div className="card shadow rounded-4">
        <div className="table-responsive">
          <Table hover className="mb-0 align-middle">
            <thead>
              <tr>
                <th>SL</th>
                <th>Product</th>
                <th>Brand</th>
                <th>Color</th>
                <th className="text-end">RAM</th>
                <th className="text-end">ROM</th>
                <th className="text-end">Purchase</th>
                <th className="text-end">Sale</th>
                <th className="text-end">Profit</th>
              </tr>
            </thead>

            <tbody>
              {currentData.length > 0 ? (
                currentData.map((item, index) => (
                  <tr key={item.id}>
                    <td>{indexOfFirst + index + 1}</td>
                    <td>{item.product_name}</td>
                    <td>{item.brand}</td>
                    <td>{item.color}</td>
                    <td className="text-end">{item.ram}</td>
                    <td className="text-end">{item.rom}</td>
                    <td className="text-end">৳{item.purchase_price}</td>
                    <td className="text-end">৳{item.sale_price}</td>
                    <td className="text-end text-success fw-bold">
                      ৳{item.profit}
                    </td>
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan="9" className="text-center py-4">
                    No data found
                  </td>
                </tr>
              )}

           
              <tr className="table-light fw-bold">
                <td colSpan="6" className="text-end">Page Total</td>
                <td className="text-end">৳{Number(pageTotalPurchase || 0).toFixed(2)}</td>
                <td className="text-end">৳{Number(pageTotalSale || 0).toFixed(2)}</td>
                <td className="text-end">৳{Number(pageTotalProfit || 0).toFixed(2)}</td>
              </tr>

              
              <tr className="text-white fw-bold" style={{ background: "#212529" }}>
                <td colSpan="6" className="text-end">Grand Total</td>
                <td className="text-end">৳{Number(totalPurchase || 0).toFixed(2)}</td>
                <td className="text-end">৳{Number(totalSale || 0).toFixed(2)}</td>
                <td className="text-end">৳{Number(totalProfit || 0).toFixed(2)}</td>
              </tr>

            </tbody>

          </Table>
        </div>
      </div>

    </div>
  );
}