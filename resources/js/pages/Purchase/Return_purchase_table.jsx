import React, { useState, useEffect } from "react";
import { Table, Form, InputGroup, Button, Collapse, Badge } from "react-bootstrap";
import { FaPlus, FaChevronDown, FaChevronUp, FaSearch } from "react-icons/fa";
import { Link } from "react-router-dom";
import axios from "axios";
import * as XLSX from "xlsx";
import { saveAs } from "file-saver";

export default function PurchaseReturnList() {
  const [returns, setReturns] = useState([]);
  const [search, setSearch] = useState("");
  const [branchFilter, setBranchFilter] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [expandedRow, setExpandedRow] = useState(null);
  const [startDate, setStartDate] = useState("");
  const [endDate, setEndDate] = useState("");

  const itemsPerPage = 20;
  const token = localStorage.getItem("token");

  useEffect(() => {
    document.title = "Purchase Return | Dashboard";
    fetchReturns();
  }, []);

  const fetchReturns = async () => {
    try {
      const res = await axios.get(
        `${import.meta.env.VITE_API_URL}/api/purchase-returns`,
        { headers: { Authorization: `Bearer ${token}` } }
      );

      //  branch uses stock_manages.to_branch if it exists
      const data = (res.data.returns || []).map(r => ({
        ...r,
        branch: r.branch || r.stock_manage?.to_branch || "N/A", 
        prepared_by_name: r.prepared_by_name || "System"
      }));

      setReturns(data);
    } catch (err) {
      console.error("Error fetching returns:", err);
    }
  };

  // 🔍 Filter Logic
  const filtered = returns.filter(r => {
    const searchTerm = search.toLowerCase();
    const matchesSearch =
      (r.imei?.toLowerCase() || "").includes(searchTerm) ||
      (r.product_name?.toLowerCase() || "").includes(searchTerm) ||
      (r.brand?.toLowerCase() || "").includes(searchTerm) ||
      (r.note?.toLowerCase() || "").includes(searchTerm);

    const matchesBranch = branchFilter ? r.branch === branchFilter : true;

    let matchesDate = true;
    const itemDate = r.date;
    if (startDate && itemDate < startDate) matchesDate = false;
    if (endDate && itemDate > endDate) matchesDate = false;

    return matchesSearch && matchesBranch && matchesDate;
  });

  const branches = [...new Set(returns.map(r => r.branch))].filter(Boolean);
  const totalPages = Math.ceil(filtered.length / itemsPerPage);
  const currentData = filtered.slice(
    (currentPage - 1) * itemsPerPage,
    currentPage * itemsPerPage
  );

  const exportToExcel = () => {
    if (!filtered.length) return alert("No data to export!");
    const formattedData = filtered.map((item, i) => ({
      SL: i + 1,
      Date: item.date,
      IMEI: item.imei || "N/A",
      Product: item.product_name,
      Brand: item.brand || "N/A",
      RAM: item.ram || "-",
      ROM: item.rom || "-",
      Color: item.color || "-",
      Branch: item.branch,
      Quantity: item.quantity,
      "Return Price": item.return_price,
      "Prepared By": item.prepared_by_name,
      Note: item.note || "No reason provided"
    }));

    const worksheet = XLSX.utils.json_to_sheet(formattedData);
    const workbook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(workbook, worksheet, "Purchase Returns");

    const excelBuffer = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
    saveAs(new Blob([excelBuffer], { type: "application/octet-stream" }), `Purchase_Returns_${new Date().toISOString().split("T")[0]}.xlsx`);
  };

  return (
    <div className="container-fluid px-md-10">
   
      <div className="d-flex flex-column flex-md-row justify-content-between align-items-center mb-4 p-4 rounded-4 shadow-sm"
           style={{ background: "linear-gradient(135deg, #01753b, #03a65a)", color: "white" }}>
        <div>
          <h3 className="fw-bold mb-1 text-white">🧾 Purchase Returns</h3>
          <p className="mb-0 text-white-50">Manage and track returned inventory</p>
        </div>
        <div className="d-flex gap-2 mt-3 mt-md-0">
          <Link to="/purchase-return-form" className="btn btn-light fw-semibold px-4 py-2" style={{ borderRadius: "10px" }}>
            <FaPlus className="me-2" /> Return Purchase
          </Link>
          <Button variant="light" onClick={exportToExcel} className="fw-semibold">⬇ Export</Button>
        </div>
      </div>

    
      <div className="card shadow-sm mb-4 border-0 rounded-4">
        <div className="card-body p-4">
          <div className="row g-3">
            <div className="col-md-4">
              <Form.Label className="small fw-bold text-muted">Search</Form.Label>
              <InputGroup>
                <InputGroup.Text className="bg-light border-end-0"><FaSearch className="text-muted" /></InputGroup.Text>
                <Form.Control placeholder="IMEI, Product, Brand..." value={search} onChange={e => { setSearch(e.target.value); setCurrentPage(1); }} className="bg-light border-start-0" />
              </InputGroup>
            </div>
            <div className="col-md-2">
              <Form.Label className="small fw-bold text-muted">Branch</Form.Label>
              <Form.Select className="bg-light" value={branchFilter} onChange={e => { setBranchFilter(e.target.value); setCurrentPage(1); }}>
                <option value="">All Branches</option>
                {branches.map(b => <option key={b} value={b}>{b}</option>)}
              </Form.Select>
            </div>
            <div className="col-md-3">
              <Form.Label className="small fw-bold text-muted">From Date</Form.Label>
              <Form.Control className="bg-light" type="date" value={startDate} onChange={e => setStartDate(e.target.value)} />
            </div>
            <div className="col-md-3">
              <Form.Label className="small fw-bold text-muted">To Date</Form.Label>
              <Form.Control className="bg-light" type="date" value={endDate} onChange={e => setEndDate(e.target.value)} />
            </div>
          </div>
        </div>
      </div>


      <div className="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div className="table-responsive">
          <Table hover className="align-middle mb-0">
            <thead className="table-light text-uppercase" style={{ fontSize: "0.75rem", letterSpacing: "0.5px" }}>
              <tr>
                <th className="ps-4 py-3">SL</th>
                <th>Date</th>
                <th>IMEI</th>
                <th>Product Details</th>
                <th>Branch</th>
                <th>Qty</th>
                <th>Return Price</th>
                <th>Prepared By</th>
                <th className="text-center">Action</th>
              </tr>
            </thead>
            <tbody style={{ fontSize: "0.85rem" }}>
              {currentData.length > 0 ? currentData.map((item, index) => (
                <React.Fragment key={item.id}>
                  <tr style={{ cursor: "pointer" }} onClick={() => setExpandedRow(expandedRow === item.id ? null : item.id)}>
                    <td className="ps-4 text-muted">{(currentPage - 1) * itemsPerPage + index + 1}</td>
                    <td>{item.date}</td>
                    <td className="fw-bold text-primary">{item.imei || '-'}</td>
                    <td>
                      <div className="fw-semibold text-dark">{item.product_name}</div>
                      <div className="text-muted text-uppercase" style={{ fontSize: "0.7rem" }}>
                        {item.brand || 'N/A'} | {item.ram || '-'}/{item.rom || '-'} | {item.color || '-'}
                        {item.battery_health && item.battery_health !== '-' && ` | BH: ${item.battery_health}%`}
                      </div>
                    </td>
                    <td><Badge bg="info" className="text-white fw-normal">{item.branch}</Badge></td>
                    <td className="fw-bold">{item.quantity}</td>
                    <td className="fw-bold text-success">TK {item.return_price ? Number(item.return_price).toLocaleString() : '0'}</td>
                    <td><Badge bg="secondary" className="fw-normal">{item.prepared_by_name}</Badge></td>
                    <td className="text-center">
                      <Button variant="light" size="sm" className="rounded-circle border">
                        {expandedRow === item.id ? <FaChevronUp /> : <FaChevronDown />}
                      </Button>
                    </td>
                  </tr>
                  <tr>
                    <td colSpan={9} className="p-0 border-0">
                      <Collapse in={expandedRow === item.id}>
                        <div className="px-4 py-3">
                          <div className="bg-light p-3 rounded-3 border-start border-4 border-success">
                            <strong className="text-muted small text-uppercase d-block mb-1">Reason for Return:</strong>
                            <p className="mb-0 text-dark fw-medium">{item.note || "No reason provided."}</p>
                          </div>
                        </div>
                      </Collapse>
                    </td>
                  </tr>
                </React.Fragment>
              )) : (
                <tr>
                  <td colSpan={9} className="text-center py-5 text-muted italic">
                    <div className="d-flex flex-column align-items-center">
                      <FaSearch size={30} className="mb-2 opacity-25" />
                      <span>No return records found matching your filters.</span>
                    </div>
                  </td>
                </tr>
              )}
            </tbody>
          </Table>
        </div>

        {totalPages > 1 && (
          <div className="d-flex justify-content-between align-items-center px-4 py-3 bg-white border-top">
            <div className="text-muted small">Showing <strong>{currentData.length}</strong> of {filtered.length} entries</div>
            <div className="d-flex align-items-center gap-2">
              <Button variant="outline-success" size="sm" disabled={currentPage === 1} onClick={() => setCurrentPage(currentPage - 1)}>Prev</Button>
              <div className="px-3 py-1 bg-light rounded-2 small fw-bold">Page {currentPage} of {totalPages}</div>
              <Button variant="outline-success" size="sm" disabled={currentPage === totalPages} onClick={() => setCurrentPage(currentPage + 1)}>Next</Button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}