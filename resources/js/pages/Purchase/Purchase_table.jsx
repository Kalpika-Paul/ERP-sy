import React, { useState, useEffect } from "react";
import Table from "react-bootstrap/Table";
import { FaPlus, FaDownload, FaChevronDown, FaChevronUp } from "react-icons/fa";
import { Link } from "react-router-dom";
import { Form, InputGroup, Button, Collapse } from "react-bootstrap";
import axios from "axios";
import * as XLSX from "xlsx";
import { saveAs } from "file-saver";
import { FaSearch, FaTimes } from "react-icons/fa";

export default function Purchase() {
  const [purchases, setPurchases] = useState([]);
  const [search, setSearch] = useState("");
  const [branchFilter, setBranchFilter] = useState("");
  const [productFilter, setProductFilter] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [expandedRow, setExpandedRow] = useState(null);

  const [startDate, setStartDate] = useState("");
  const [endDate, setEndDate] = useState("");

  const itemsPerPage = 20;
  const user = JSON.parse(localStorage.getItem("user") || "{}");
  const token = localStorage.getItem("token");

  useEffect(() => {
    document.title = "Purchase Management | Dashboard";
    fetchPurchases();
  }, []);

  const fetchPurchases = async () => {
    try {
      const res = await axios.get(`${import.meta.env.VITE_API_URL}/api/purchase`, {
        headers: { Authorization: `Bearer ${token}` },
      });
      setPurchases(res.data.purchases || []);
    } catch (err) {
      console.error(err);
      alert("Failed to load purchases");
    }
  };

  const handleDelete = async (id) => {
    if (!window.confirm("Are you sure you want to delete this purchase?")) return;
    try {
      await axios.delete(`${import.meta.env.VITE_API_URL}/api/purchase/${id}`, {
        headers: { Authorization: `Bearer ${token}` },
      });
      setPurchases((prev) => prev.filter((p) => p.id !== id));
      alert("Purchase deleted successfully!");
    } catch (err) {
      console.error(err);
      alert("Failed to delete purchase");
    }
  };

  const toggleRow = (id) => setExpandedRow(expandedRow === id ? null : id);

  const filtered = purchases.filter((p) => {
    const searchTerm = search.trim().toLowerCase();

    let matchesSearch = true;
    if (searchTerm) {
      matchesSearch = Object.values(p).some(
        (value) =>
          value !== null &&
          value !== undefined &&
          String(value).toLowerCase().includes(searchTerm)
      );
    }

    const matchesBranch = branchFilter ? p.branch?.toLowerCase() === branchFilter.toLowerCase() : true;
    const matchesProduct = productFilter ? p.product_name?.toLowerCase() === productFilter.toLowerCase() : true;

    let matchesDate = true;

    if (startDate && endDate && p.month) { 
      const [startYear, startMonth, startDay] = startDate.split("-").map(Number);
      const [endYear, endMonth, endDay] = endDate.split("-").map(Number);

      const start = new Date(startYear, startMonth - 1, startDay);
      const end = new Date(endYear, endMonth - 1, endDay);


      const [year, month, day] = p.month.split("-").map(Number);
      const purchaseDate = new Date(year, month - 1, day);

      matchesDate = purchaseDate >= start && purchaseDate <= end;
    }

    return matchesSearch && matchesBranch && matchesProduct && matchesDate;
  });

  const totalPages = Math.ceil(filtered.length / itemsPerPage);
  const indexOfLast = currentPage * itemsPerPage;
  const indexOfFirst = indexOfLast - itemsPerPage;
  const currentPurchases = filtered.slice(indexOfFirst, indexOfLast);

  const exportExcel = () => {
    const hasFilter = search || branchFilter || productFilter || (startDate && endDate);
    const dataToExport = hasFilter ? filtered : purchases;

    const excelData = dataToExport.map((p, index) => ({
      SL: index + 1,
      Barcode: p.barcode,
      Prepared: p.prepared_by,
      Branch: p.branch,
      Product: p.product_name,
      Brand: p.brand,
      ROM: p.rom,
      Color: p.color,
      Battery: p.battery_health,
      Price: p.price,
      SalesPrice: p.salesPrice || "-",
      Variant: p.variant,
      RAM: p.ram,
      IMEI: p.imei,
      Box: p.box,
      Quantity: p.quantity,
      Month: p.month,
      Supplier: p.supplier_name,
      Contact: p.contact_number,
      NID: p.nid_number,
      Memo: p.memo,
      Status: p.status,
      Condition: p.condition,
    }));

    const worksheet = XLSX.utils.json_to_sheet(excelData);
    const workbook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(workbook, worksheet, hasFilter ? "Filtered Purchases" : "All Purchases");

    const excelBuffer = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
    const blob = new Blob([excelBuffer], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" });
    saveAs(blob, hasFilter ? "filtered_purchases.xlsx" : "all_purchases.xlsx");
  };

  const downloadImage = async (url, filename) => {
    try {
      const res = await axios.get(url, { responseType: "blob" });
      const blob = new Blob([res.data], { type: res.data.type });
      const link = document.createElement("a");
      link.href = window.URL.createObjectURL(blob);
      link.download = filename;
      link.click();
    } catch (err) {
      console.error("Download failed", err);
      alert("Download failed");
    }
  };

  const branches = [...new Set(purchases.map(p => p.branch).filter(Boolean))];
  const products = [...new Set(purchases.map(p => p.product_name).filter(Boolean))];

  return (
    <div className="container-fluid px-md-10">
    
      <div className="d-flex flex-column flex-md-row justify-content-between align-items-center mb-4 p-3 p-md-4 rounded-4 shadow-sm" style={{ background: "linear-gradient(135deg, #01753b, #03a65a)", color: "white" }}>
        <div className="text-center text-md-start mb-3 mb-md-0">
          <h3 className="fw-bold mb-1">🧾 Purchase Management</h3>
          <small>Manage all your purchases</small>
        </div>
        <div className="d-flex flex-wrap justify-content-center gap-2">
          <Link to="/purchase/add" className="btn btn-light fw-semibold d-flex align-items-center" style={{ borderRadius: "12px" }}>
            <FaPlus className="me-2" /> Add Purchase
          </Link>
          <Button variant="light" onClick={exportExcel} className="fw-semibold"> ⬇ Export Excel</Button>
        </div>
      </div>

  
      <div className="card shadow-sm mb-4 rounded-4 border-0">
        <div className="card-body">
          <div className="row g-2">
            <div className="col-12 col-sm-4 col-md-4">
              <InputGroup className="shadow-sm rounded-3">
                <InputGroup.Text className="bg-white border-end-0">
                  <FaSearch className="text-muted" />
                </InputGroup.Text>
                <Form.Control
                  placeholder="Search..."
                  value={search}
                  onChange={(e) => {
                    setSearch(e.target.value);
                    setCurrentPage(1);
                  }}
                  className="border-start-0"
                />
                {search && (
                  <Button
                    variant="outline-secondary"
                    onClick={() => setSearch("")}
                    className="border-start-0"
                  >
                    <FaTimes />
                  </Button>
                )}
              </InputGroup>
            </div>

            <div className="col-12 col-sm-4 col-md-2">
              <Form.Select
                value={branchFilter}
                onChange={(e) => setBranchFilter(e.target.value)}
                className="shadow-sm"
              >
                <option value="">All Branches</option>
                {branches.map((b) => (
                  <option key={b} value={b}>{b}</option>
                ))}
              </Form.Select>
            </div>

            <div className="col-12 col-sm-4 col-md-2">
              <Form.Select
                value={productFilter}
                onChange={(e) => setProductFilter(e.target.value)}
                className="shadow-sm"
              >
                <option value="">All Products</option>
                {products.map((p) => (
                  <option key={p} value={p}>{p}</option>
                ))}
              </Form.Select>
            </div>

            <div className="col-12 col-sm-4 col-md-2">
              <Form.Control
                type="date"
                value={startDate}
                onChange={(e) => setStartDate(e.target.value)}
                className="shadow-sm"
              />
            </div>
            <div className="col-12 col-sm-4 col-md-2">
              <Form.Control
                type="date"
                value={endDate}
                onChange={(e) => setEndDate(e.target.value)}
                className="shadow-sm"
              />
            </div>
          </div>
        </div>
      </div>

      
      <div className="card border-0 rounded-4 mb-4 shadow-lg overflow-hidden">
        <div className="table-responsive">
          <Table hover striped className="align-middle mb-0" style={{ fontSize: "0.85rem", minWidth: "1000px" }}>
            <thead className="table-light">
              <tr>
                <th className="text-start" style={{ width: "60px" }}>SL</th>
                <th className="text-start" style={{ width: "120px" }}>IMEI</th>
                <th className="text-start" style={{ width: "110px" }}>Prepared</th>
                <th className="text-start" style={{ width: "100px" }}>Branch</th>
                <th className="text-start" style={{ width: "100px" }}>Brand</th>
                <th className="text-start" style={{ width: "120px" }}>Product</th>
                <th className="text-start" style={{ width: "90px" }}>Color</th>
                <th className="text-start" style={{ width: "90px" }}>ROM</th>
                <th className="text-start" style={{ width: "90px" }}>Battery</th>
                <th className="text-start" style={{ width: "90px" }}>P.P.</th>
                <th className="text-start" style={{ width: "90px" }}>S.P.</th>
                {user?.type === "admin" && <th className="text-start" style={{ width: "150px" }}>Actions</th>}
                <th className="text-start" style={{ width: "80px" }}>Details</th>
              </tr>
            </thead>
            <tbody>
              {currentPurchases.length ? currentPurchases.map((p, idx) => (
                <React.Fragment key={p.id}>
                  <tr>
                    <td>{indexOfFirst + idx + 1}</td>
                    <td>{p.imei}</td>
                    <td>{p.prepared_by || "N/A"}</td>
                    <td>{p.branch?.split(" ")[0] || "-"}</td>
                    <td>{p.brand || "-"}</td>
                    <td>{p.product_name || "-"}</td>
                    <td>{p.color || "-"}</td>
                    <td>{p.rom || "-"}</td>
                    <td>{p.battery_health || "-"}</td>
                    <td>TK {p.price || 0}</td>
                    <td>{p.salesPrice ? `TK ${p.salesPrice}` : "-"}</td>
                    {user?.type === "admin" && (
                      <td>
                        <div className="d-flex gap-1">
                          <Link to={`/purchase/edit/${p.id}`} className="btn btn-sm btn-outline-success">Edit</Link>
                          <button className="btn btn-sm btn-outline-danger" onClick={() => handleDelete(p.id)}>Delete</button>
                        </div>
                      </td>
                    )}
                    <td>
                      <Button size="sm" variant="outline-secondary" onClick={() => toggleRow(p.id)}>
                        {expandedRow === p.id ? <FaChevronUp /> : <FaChevronDown />}
                      </Button>
                    </td>
                  </tr>

                  <tr>
                    <td colSpan={user?.type === "admin" ? 13 : 12} className="p-0 border-0">
                      <Collapse in={expandedRow === p.id}>
                        <div className="p-3 bg-light border-bottom">
                          <div className="row g-3">
                            <div className="col-6 col-md-3"><strong>Variant:</strong> {p.variant || "-"}</div>
                            <div className="col-6 col-md-3"><strong>RAM:</strong> {p.ram || "-"}</div>
                            <div className="col-6 col-md-3"><strong>Box:</strong> {p.box || "-"}</div>
                            <div className="col-6 col-md-3"><strong>Quantity:</strong> {p.quantity || "-"}</div>
                            <div className="col-6 col-md-3"><strong>Branch:</strong> {p.branch || "-"}</div>
                            <div className="col-6 col-md-3"><strong>Month:</strong> {p.month || "-"}</div>
                            <div className="col-6 col-md-3"><strong>Supplier:</strong> {p.supplier_name || "-"}</div>
                            <div className="col-6 col-md-3"><strong>Contact:</strong> {p.contact_number || "-"}</div>
                            <div className="col-6 col-md-3"><strong>NID:</strong> {p.nid_number || "-"}</div>
                            <div className="col-6 col-md-3"><strong>Memo:</strong> {p.memo || "-"}</div>
                            <div className="col-6 col-md-3"><strong>Status:</strong> {p.status ? (
                              <span className={`badge ${p.status === "pending" ? "bg-warning text-dark" : "bg-success"}`}>{p.status}</span>
                            ) : "-"}</div>
                            <div className="col-6 col-md-3"><strong>Condition:</strong> {p.condition || "-"}</div>

                            {user?.type === "admin" && (
                              <>
                                <div className="col-6 col-md-3">
                                  <strong>NID Image:</strong>{" "}
                                  {p.nid_image ? (
                                    <button className="btn btn-sm btn-success" onClick={() => downloadImage(p.nid_image, `NID_${p.nid_number}.jpg`)}><FaDownload /></button>
                                  ) : "No Image"}
                                </div>
                                <div className="col-6 col-md-3">
                                  <strong>Memo Image:</strong>{" "}
                                  {p.memo_image ? (
                                    <button className="btn btn-sm btn-success" onClick={() => downloadImage(p.memo_image, `Memo_${p.id}.jpg`)}><FaDownload /></button>
                                  ) : "No Image"}
                                </div>
                              </>
                            )}
                          </div>
                        </div>
                      </Collapse>
                    </td>
                  </tr>
                </React.Fragment>
              )) : (
                <tr>
                  <td colSpan={user?.type === "admin" ? 13 : 12} className="text-center py-4 text-muted">
                    🚫 No purchases found
                  </td>
                </tr>
              )}
            </tbody>
          </Table>
        </div>

        {/* Pagination */}
        {totalPages > 1 && (
          <div className="card-footer bg-white border-0 py-3">
            <div className="d-flex justify-content-center gap-2 flex-wrap">
              <Button variant="outline-secondary" disabled={currentPage === 1} onClick={() => setCurrentPage(prev => prev - 1)} className="rounded-pill">Prev</Button>
              <div className="d-flex gap-1 overflow-auto px-2">
                {[...Array(totalPages)].map((_, i) => (
                  <Button
                    key={i}
                    variant={currentPage === i + 1 ? "success" : "outline-success"}
                    className="rounded-circle"
                    style={{ minWidth: "40px", height: "40px" }}
                    onClick={() => setCurrentPage(i + 1)}
                  >
                    {i + 1}
                  </Button>
                ))}
              </div>
              <Button variant="outline-secondary" disabled={currentPage === totalPages} onClick={() => setCurrentPage(prev => prev + 1)} className="rounded-pill">Next</Button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}