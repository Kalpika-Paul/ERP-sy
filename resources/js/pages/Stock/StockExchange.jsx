import React, { useState, useEffect } from "react";
import { Form, Button, Card, Table, InputGroup, Row, Col } from "react-bootstrap";
import axios from "axios";
import { FaDownload, FaSearch, FaExchangeAlt } from "react-icons/fa";
import * as XLSX from "xlsx";
import { saveAs } from "file-saver";

export default function StockExchange() {
  const [imei, setImei] = useState("");
  const [product, setProduct] = useState(null);
  const [branches] = useState([
    "Bashundhara City",
    "Jamuna Future Park",
    "Company",
  ]);
  const [destination, setDestination] = useState("");
  const [history, setHistory] = useState([]);
  const token = localStorage.getItem("token");

  useEffect(() => {
    fetchAllHistory();
  }, [token]);

  const fetchAllHistory = async () => {
    try {
      const res = await axios.get(
        `${import.meta.env.VITE_API_URL}/api/stock-history-all`,
        { headers: { Authorization: `Bearer ${token}` } }
      );
      const formatted = res.data.map((item) => ({
        name: item.product_name,
        imei: item.imei,
        branch: item.from_branch,
        destination: item.to_branch,
        quantity: item.quantity,
        date: item.transfer_date,
      }));
      setHistory(formatted);
    } catch (err) {
      console.error("History Load Error:", err);
      setHistory([]);
    }
  };

  const fetchProduct = async () => {
    if (!imei) return alert("Please enter IMEI number");
    try {
      const res = await axios.get(
        `${import.meta.env.VITE_API_URL}/api/stock-manage/${imei}`,
        { headers: { Authorization: `Bearer ${token}` } }
      );
      const productData = res.data.product;
      setProduct(productData);
      fetchHistory(productData.id, productData);
    } catch (err) {
      alert("Product not found");
      setProduct(null);
      setHistory([]);
    }
  };

  const fetchHistory = async (id) => {
    try {
      const res = await axios.get(
        `${import.meta.env.VITE_API_URL}/api/stock-history/${id}`,
        { headers: { Authorization: `Bearer ${token}` } }
      );
      const formatted = res.data.map((item) => ({
        name: item.product_name,
        imei: item.imei,
        branch: item.from_branch,
        destination: item.to_branch,
        quantity: item.quantity,
        date: item.transfer_date,
      }));
      setHistory(formatted);
    } catch (err) {
      setHistory([]);
    }
  };

  const transferStock = async () => {
    if (!product) return alert("No product selected");
    if (!destination) return alert("Please select destination branch");
    try {
      await axios.post(
        `${import.meta.env.VITE_API_URL}/api/exchange-stock`,
        {
          purchase_id: product.id,
          source_branch: product.branch,
          destination_branch: destination,
        },
        { headers: { Authorization: `Bearer ${token}` } }
      );
      alert("Stock transferred successfully!");
      const updatedProduct = { ...product, available_stock: 0, branch: destination };
      setProduct(updatedProduct);
      fetchHistory(product.id);
      setDestination("");
      setImei("");
    } catch (err) {
      alert("Failed to transfer stock");
    }
  };

  const exportToExcel = () => {
    if (history.length === 0) return alert("No data to export");
    const data = history.map((item, index) => ({
      SL: index + 1,
      Product: item.name,
      IMEI: item.imei,
      From: item.branch,
      To: item.destination,
      Quantity: item.quantity,
      Date: item.date,
    }));
    const worksheet = XLSX.utils.json_to_sheet(data);
    const workbook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(workbook, worksheet, "Stock History");
    const excelBuffer = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
    saveAs(new Blob([excelBuffer]), "stock_history.xlsx");
  };

  return (
    <div className="container-fluid px-1 px-md-3">
      <style>
        {`
          .table-row-hover:hover { background-color: #f0f9f5; }
          .responsive-card { border-radius: 15px; border: none; }
        `}
      </style>

      <div
        className="d-flex flex-column flex-md-row justify-content-between align-items-center mb-4 p-3 p-md-4 rounded-4 shadow-sm"
        style={{
          background: "linear-gradient(135deg, #01753b, #03a65a)",
          color: "white",
        }}
      >
        <div className="text-center text-md-start mb-3 mb-md-0">
          <h3 className="fw-bold mb-1">🧾 Stock Manage</h3>
          <small>Manage your stock</small>
        </div>
        <Button variant="light" onClick={exportToExcel} className="fw-semibold">
          <FaDownload className="me-1" /> Export Excel
        </Button>
      </div>

      <Row className="mb-4">
        <Col xs={12} lg={12} xl={12}> 
          <div className="d-flex flex-column gap-2">
            <InputGroup className="shadow-sm border rounded-3 overflow-hidden transition-all">
            
              <InputGroup.Text
                className="bg-success text-white border-0 px-3 d-none d-sm-flex"
                style={{ fontSize: '0.9rem' }}
              >
                <span className="fw-semibold">Transfer Stock</span>
              </InputGroup.Text>

            
              <Form.Control
                type="text"
                placeholder="Enter IMEI number..."
                value={imei}
                onChange={(e) => setImei(e.target.value)}
                onKeyDown={(e) => e.key === 'Enter' && fetchProduct()}
                className="border-0 py-2 px-3 focus-ring-none"
                style={{ boxShadow: 'none' }}
              />

     
              <Button
                variant="success"
                onClick={fetchProduct}
                className="px-4 d-flex align-items-center border-0"
                style={{ transition: '0.2s' }}
              >
                <FaSearch className="me-2" />
                <span className="d-none d-md-inline">Search</span>
              </Button>
            </InputGroup>
          </div>
        </Col>
      </Row>

      {product && (
        <Card className="responsive-card shadow-sm mb-4 bg-light p-3">
          <div className="row">
            <div className="col-md-6 mb-3 mb-md-0">
              <h5 className="fw-bold text-success">{product.name}</h5>
              <div className="small">
                <strong>IMEI:</strong> {product.imei} <br />
                <strong>Current Branch:</strong> {product.branch} <br />
                <strong>Available Stock:</strong> {product.available_stock} <br />
                <strong>Price:</strong> TK {product.price}
              </div>
            </div>
            <div className="col-md-6 d-flex flex-column justify-content-center">
              <Form.Group className="mb-2">
                <Form.Select
                  value={destination}
                  onChange={(e) => setDestination(e.target.value)}
                  className="rounded-3"
                >
                  <option value="">Select Destination Branch</option>
                  {branches
                    .filter((b) => b !== product.branch)
                    .map((b, i) => (
                      <option key={i}>{b}</option>
                    ))}
                </Form.Select>
              </Form.Group>
              <Button variant="success" onClick={transferStock} className="w-100 rounded-3">
                <FaExchangeAlt className="me-2" /> Transfer 
              </Button>
            </div>
          </div>
        </Card>
      )}


      <div className="card border-0 shadow-lg rounded-4 overflow-hidden mb-5">
        <div className="table-responsive">
          <Table hover striped className="align-middle mb-0" style={{ minWidth: "800px" }}>
            <thead className="table-light">
              <tr>
                <th className="ps-3">#</th>
                <th>Product</th>
                <th>IMEI</th>
                <th>From</th>
                <th>To</th>
                <th className="text-center">Qty</th>
                <th className="pe-3">Date</th>
              </tr>
            </thead>
            <tbody>
              {history.length > 0 ? (
                history.map((h, idx) => (
                  <tr key={idx} className="table-row-hover">
                    <td className="ps-3">{idx + 1}</td>
                    <td className="fw-semibold">{h.name}</td>
                    <td>{h.imei}</td>
                    <td><span className="badge bg-secondary opacity-75">{h.branch}</span></td>
                    <td><span className="badge bg-success">{h.destination}</span></td>
                    <td className="text-center">{h.quantity}</td>
                    <td className="pe-3">
                      {h.date ? new Date(h.date.replace(" ", "T")).toLocaleDateString("en-BD") : "N/A"}
                    </td>
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan="7" className="text-center text-muted py-4">
                    No transfer history yet
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