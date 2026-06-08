import React, { useState, useEffect } from "react";
import { Table, Form, InputGroup, Button, Collapse } from "react-bootstrap";
import { FaChevronDown, FaChevronUp, FaDownload, FaSearch, FaFileInvoice } from "react-icons/fa";
import { Link } from "react-router-dom";
import axios from "axios";
import * as XLSX from "xlsx";
import { saveAs } from "file-saver";

export default function SalesTable() {
  const [sales, setSales] = useState([]);
  const [search, setSearch] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [expandedRow, setExpandedRow] = useState(null);
  const itemsPerPage = 20;
  const token = localStorage.getItem("token");

  useEffect(() => {
    document.title = "Supplier Info | Dashboard";
    fetchSales();
  }, []);

  const fetchSales = async () => {
    try {
      const res = await axios.get(
        `${import.meta.env.VITE_API_URL}/api/supplier-info`,
        { headers: { Authorization: `Bearer ${token}` } }
      );

      console.log("API DATA:", res.data); 

      const mappedSales = res.data.map((item, index) => ({
        id: index + 1,
        name: item.supplier_name || "-",
        phone: item.contact_number || "-",
        nid: item.nid_number || "-",
        memo: item.memo || "-",
        date: item.month || "-",
      }));

      setSales(mappedSales);
    } catch (err) {
      console.error(err);
      alert("Failed to load sales");
    }
  };

  const toggleRow = (id) => setExpandedRow(expandedRow === id ? null : id);

  const filtered = sales.filter((s) => {
    const term = search.trim().toLowerCase();
    if (!term) return true;

    const flattenValues = (obj) => {
      if (obj === null || obj === undefined) return "";
      if (typeof obj === "object") {
        if (Array.isArray(obj)) return obj.map(flattenValues).join(" ");
        return Object.values(obj).map(flattenValues).join(" ");
      }
      return String(obj);
    };

    const flattened = flattenValues(s).toLowerCase();
    return flattened.includes(term);
  });

  const indexOfLast = currentPage * itemsPerPage;
  const indexOfFirst = indexOfLast - itemsPerPage;
  const currentSales = filtered.slice(indexOfFirst, indexOfLast);

  const exportToExcel = () => {
    const excelData = filtered.map((s, index) => ({
      SL: index + 1,
      Name: s.name,
      Phone: s.phone,
      Memo: s.memo,
      NID: s.nid,
      Date: s.date,
    }));

    const worksheet = XLSX.utils.json_to_sheet(excelData);
    const workbook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(workbook, worksheet, "Suppliers");

    const excelBuffer = XLSX.write(workbook, {
      bookType: "xlsx",
      type: "array",
    });

    const data = new Blob([excelBuffer], {
      type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    });

    saveAs(data, "supplier-report.xlsx");
  };

  return (
    <div className="container-fluid px-1 px-md-3">
      
      <div
        className="d-flex flex-column flex-md-row justify-content-between align-items-center mb-4 p-3 p-md-4 rounded-4 shadow-sm"
        style={{
          background: "linear-gradient(135deg, #01753b, #03a65a)",
          color: "#fff",
        }}
      >
        <div className="text-center text-md-start mb-3 mb-md-0">
          <h3 className="fw-bold mb-1">👨‍💼 Supplier Report</h3>
          <small>See supplier details</small>
        </div>

        <Button variant="light" onClick={exportToExcel} className="fw-semibold">
          <FaDownload className="me-2" /> Download Excel
        </Button>
      </div>

      <div className="card border-0 shadow-sm rounded-4 mb-4">
        <div className="card-body">
          <InputGroup>
            <InputGroup.Text className="bg-white border-end-0 rounded-start-pill ps-3">
              <FaSearch className="text-muted" />
            </InputGroup.Text>
            <Form.Control
              placeholder="Search by Customer, Phone, or Address..."
              value={search}
              onChange={(e) => {
                setSearch(e.target.value);
                setCurrentPage(1);
              }}
              className="border-start-0"
            />
            <Button
              variant="outline-secondary"
              onClick={() => setSearch("")}
              className="rounded-end-pill px-3"
            >
              Clear
            </Button>
          </InputGroup>
        </div>
      </div>

      <div className="card border-0 shadow-lg rounded-4 overflow-hidden mb-5">
        <div className="card-body p-0 table-responsive">
          <Table hover className="align-middle mb-0" style={{ fontSize: "0.85rem", minWidth: "1100px" }}>
            <thead className="table-light">
              <tr>
                <th className="ps-3">SL</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Memo</th>
                <th>NID</th>
                <th>Date</th>
              </tr>
            </thead>

            <tbody>
              {currentSales.length > 0 ? (
                currentSales.map((s, index) => (
                  <tr key={s.id}>
                    <td className="ps-3">{indexOfFirst + index + 1}</td>
                    <td>{s.name}</td>
                    <td>{s.phone}</td>
                    <td>{s.memo}</td>
                    <td>{s.nid}</td>
                    <td>{s.date}</td>
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan="6" className="text-center py-3">
                    No data found
                  </td>
                </tr>
              )}
            </tbody>

          </Table>
        </div>
      </div>
    </div>
  );
}