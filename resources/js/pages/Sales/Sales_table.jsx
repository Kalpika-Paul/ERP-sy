import React, { useState, useEffect } from "react";
import {
  Table,
  Form,
  InputGroup,
  Button,
  Collapse,
  Row,
  Col,
} from "react-bootstrap";
import {
  FaChevronDown,
  FaChevronUp,
  FaDownload,
  FaSearch,
  FaFileInvoice,
} from "react-icons/fa";
import { Link } from "react-router-dom";
import axios from "axios";
import * as XLSX from "xlsx";
import { saveAs } from "file-saver";

export default function SalesTable() {
  const [sales, setSales] = useState([]);
  const [search, setSearch] = useState("");
  const [branch, setBranch] = useState("");
  const [fromDate, setFromDate] = useState("");
  const [toDate, setToDate] = useState("");
  const [statusFilter, setStatusFilter] = useState("");
  const [branches, setBranches] = useState([]);
  const [expandedRow, setExpandedRow] = useState(null);

  const token = localStorage.getItem("token");

  useEffect(() => {
    document.title = "Sales Report | Dashboard";
    fetchSales();
  }, []);

  const fetchSales = async () => {
    try {
      const res = await axios.get(
        `${import.meta.env.VITE_API_URL}/api/sale/list`,
        { headers: { Authorization: `Bearer ${token}` } }
      );

      const mappedSales = res.data.map((sale) => ({
        id: sale.id,
        invoiceCode: sale.invoice_code || "-",
        customerName: sale.customer_name,
        phone: sale.customer_phone,
        address: sale.customer_address,
        method: sale.payment_method,
        account: sale.account || "",
        branch: sale.branch ?? "N/A",
        grand_total: Number(sale.grand_total || 0),
        discount: Number(sale.discount || 0),
        preparedBy: sale.prepared_by,
        date: sale.date || "-",

        cart: (sale.items || []).map((item) => ({
          model: item.product_name,
          brand: item.brand || "-",
          color: item.color,
          status: item.status || "sold",
        })),
      }));

      setSales(mappedSales);

      const uniqueBranches = [...new Set(mappedSales.map((s) => s.branch))];
      setBranches(uniqueBranches);
    } catch (err) {
      console.error(err);
      alert("Failed to load sales");
    }
  };

  const toggleRow = (id) =>
    setExpandedRow(expandedRow === id ? null : id);

  const flattenValues = (obj) => {
    if (!obj) return "";
    if (typeof obj !== "object") return String(obj);
    if (Array.isArray(obj)) return obj.map(flattenValues).join(" ");
    return Object.values(obj).map(flattenValues).join(" ");
  };

  const filtered = sales.filter((s) => {
    const term = search.trim().toLowerCase();

    const matchesSearch = flattenValues(s).toLowerCase().includes(term);
    const matchesBranch = branch ? s.branch === branch : true;

    const saleDate = s.date ? new Date(s.date + "T00:00:00") : null;
    const matchesFrom = fromDate ? saleDate >= new Date(fromDate) : true;
    const matchesTo = toDate ? saleDate <= new Date(toDate) : true;

    const isReturned = s.cart?.some((i) => i.status === "returned");
    const status = isReturned ? "returned" : "sold";
    const matchesStatus = statusFilter ? status === statusFilter : true;

    return matchesSearch && matchesBranch && matchesFrom && matchesTo && matchesStatus;
  });

  const currentSales = filtered;

  const pageSubtotal = currentSales.reduce(
    (sum, s) => sum + (Number(s.grand_total) || 0),
    0
  );

  const grandTotal = pageSubtotal;

  const clearFilters = () => {
    setSearch("");
    setBranch("");
    setFromDate("");
    setToDate("");
    setStatusFilter("");
  };

  return (
    <div className="container-fluid px-1 px-md-3">


      <div
        className="d-flex flex-column flex-md-row justify-content-between align-items-center mb-4 p-4 rounded-4 shadow-sm"
        style={{ background: "linear-gradient(135deg, #01753b, #03a65a)", color: "white" }}
      >
   
        <div className="w-100 w-sm-auto">
          <h3 className="fw-bold mb-1 text-white">💰 Sales Report</h3>
          <small className="d-block">Manage all sales in one place</small>
        </div>

    
        <Button
          variant="light"
          className="w-0 w-sm-auto mx-auto mx-sm-0"
          style={{ whiteSpace: "nowrap" }}
        >
          <FaDownload className="me-2" />
          Download Excel
        </Button>
      </div>


      <div className="card border-0 shadow-sm rounded-4 mb-4">
        <div className="card-body">
          <Row className="g-2 align-items-center">

            <Col md={3}>
              <InputGroup>
                <InputGroup.Text><FaSearch /></InputGroup.Text>
                <Form.Control
                  value={search}
                  onChange={(e) => setSearch(e.target.value)}
                  placeholder="Search..."
                />
              </InputGroup>
            </Col>

            <Col md={2}>
              <Form.Select value={branch} onChange={(e) => setBranch(e.target.value)}>
                <option value="">All Branch</option>
                {branches.map((b, i) => (
                  <option key={i}>{b}</option>
                ))}
              </Form.Select>
            </Col>

            <Col md={2}>
              <Form.Select value={statusFilter} onChange={(e) => setStatusFilter(e.target.value)}>
                <option value="">All Status</option>
                <option value="sold">Sold</option>
                <option value="returned">Returned</option>
              </Form.Select>
            </Col>

            <Col md={2}>
              <Form.Control type="date" value={fromDate} onChange={(e) => setFromDate(e.target.value)} />
            </Col>

            <Col md={2}>
              <Form.Control type="date" value={toDate} onChange={(e) => setToDate(e.target.value)} />
            </Col>

            <Col md={1}>
              <Button className="w-100" variant="outline-secondary" onClick={clearFilters}>
                Clear
              </Button>
            </Col>

          </Row>
        </div>
      </div>

      <div className="card border-0 shadow-lg rounded-4 overflow-hidden mb-5">
        <div className="card-body p-0 table-responsive">

          <Table hover className="align-middle mb-0" style={{ fontSize: "0.85rem", minWidth: "1100px" }}>
            <thead className="table-light">
              <tr>
                <th>SL</th>
                <th>Invoice</th>
                <th>Branch</th>
                <th>Customer</th>
                <th>Phone</th>
                <th>Product</th>
                <th>Color</th>
                <th>Payment</th>
                <th>Prepared By</th>
                <th>Date</th><th>Discount</th>
                <th>Total</th>
                <th>Status</th>
                <th>Action</th>
                <th>Memo</th>
              </tr>
            </thead>

            <tbody>
              {currentSales.length ? (
                currentSales.map((s, idx) => {
                  const isReturned = s.cart?.some(i => i.status === "returned");

                  return (
                    <React.Fragment key={s.id}>

                      <tr>
                        <td>{idx + 1}</td>
                        <td className="fw-bold">{s.invoiceCode}</td>
                        <td>{s.branch}</td>
                        <td>{s.customerName}</td>
                        <td>{s.phone}</td>
                        <td>{s.cart?.[0]?.model}</td>
                        <td>{s.cart?.[0]?.color}</td>
                        <td>{s.method}</td>
                        <td>{s.preparedBy}</td>
                        <td>{s.date}</td>
                        <td>৳ {s.discount}</td>
                        <td>৳ {s.grand_total}</td>


                        <td>
                          <span className={`badge ${isReturned ? "bg-danger" : "bg-success"}`}>
                            {isReturned ? "Returned" : "Sold"}
                          </span>
                        </td>

                        <td>
                          <Button
                            size="sm"
                            variant="outline-secondary"
                            onClick={() => toggleRow(s.id)}
                          >
                            {expandedRow === s.id ? <FaChevronUp /> : <FaChevronDown />}
                          </Button>
                        </td>

                        <td>
                          <Link to={`/invoice/${s.id}`}>
                            <Button size="sm" variant="outline-primary">
                              <FaFileInvoice />
                            </Button>
                          </Link>
                        </td>
                      </tr>

                      <tr>
                        <td colSpan={15} className="p-0 border-0">
                          <Collapse in={expandedRow === s.id}>
                            <div className="p-3 bg-light">
                              <strong>Address:</strong> {s.address}
                            </div>
                          </Collapse>
                        </td>
                      </tr>

                    </React.Fragment>
                  );
                })
              ) : (
                <tr>
                  <td colSpan={15} className="text-center py-5 text-muted">
                    No sales found
                  </td>
                </tr>
              )}

              {/* TOTAL ROW */}
              <tr className=" bg-light">
                <td colSpan={11} className="text-end">Subtotal (Page):</td>
                <td colSpan={5} className="fw-bold">৳ {pageSubtotal.toFixed(2)}</td>
              </tr>

              <tr className="fw-bold bg-dark text-white">
                <td colSpan={11} className="text-end">Grand Total:</td>
                <td colSpan={5}>৳ {grandTotal.toFixed(2)}</td>
              </tr>

            </tbody>
          </Table>

        </div>
      </div>
    </div>
  );
}