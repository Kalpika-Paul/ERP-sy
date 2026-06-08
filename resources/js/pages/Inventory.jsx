import React, { useState, useEffect } from "react";
import Table from "react-bootstrap/Table";
import { Form, InputGroup, Button, Badge } from "react-bootstrap"; // Added Badge
import { FaSearch, FaTimes, FaBox } from "react-icons/fa";
import axios from "axios";
import * as XLSX from "xlsx";
import { saveAs } from "file-saver";

export default function Inventory() {
  const [products, setProducts] = useState([]);
  const [search, setSearch] = useState("");
  const [branchFilter, setBranchFilter] = useState("");
  const [productFilter, setProductFilter] = useState("");
  const [startDate, setStartDate] = useState("");
  const [endDate, setEndDate] = useState("");

  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 20;
  const token = localStorage.getItem("token");

  useEffect(() => {
    document.title = "Inventory | Dashboard";
    fetchProducts();
  }, []);

  const fetchProducts = async () => {
    try {
      const res = await axios.get(`${import.meta.env.VITE_API_URL}/api/inventory`, {
        headers: { Authorization: `Bearer ${token}` },
      });
      setProducts(res.data.products || []);
    } catch (err) {
      console.error(err);
      alert("Failed to load inventory");
    }
  };


  const filtered = products.filter((p) => {
    const searchTerm = search.trim().toLowerCase();
    const matchesSearch = !searchTerm
      ? true
      : Object.values(p).some((v) => v && String(v).toLowerCase().includes(searchTerm));

    const matchesBranch = branchFilter ? p.branch?.toLowerCase() === branchFilter.toLowerCase() : true;
    const matchesProduct = productFilter ? p.name?.toLowerCase() === productFilter.toLowerCase() : true;

    let matchesDate = true;
    if (startDate && endDate && p.month) {
      const start = new Date(startDate);
      const end = new Date(endDate);
      const purchaseDate = new Date(p.month);
      matchesDate = purchaseDate >= start && purchaseDate <= end;
    }

  
    return matchesSearch && matchesBranch && matchesProduct && matchesDate && Number(p.net_stock || 0) > 0;
  });

  
  const totalPages = Math.ceil(filtered.length / itemsPerPage);
  const indexOfFirst = (currentPage - 1) * itemsPerPage;
  const currentProducts = filtered.slice(indexOfFirst, indexOfFirst + itemsPerPage);
  const isLastPage = currentPage === totalPages;

  
  const subTotalPrice = currentProducts.reduce((sum, p) => sum + Number(p.price || 0) * Number(p.net_stock || 0), 0);
  const subTotalStock = currentProducts.reduce((sum, p) => sum + Number(p.net_stock || 0), 0);
  
  const grandTotalPrice = filtered.reduce((sum, p) => sum + Number(p.price || 0) * Number(p.net_stock || 0), 0);
  const grandTotalStock = filtered.reduce((sum, p) => sum + Number(p.net_stock || 0), 0);

  const exportExcel = () => {
    const data = filtered.map((p) => ({
      Barcode: p.barcode,
      Branch: p.branch,
      Product: p.name,
      Brand: p.product_brand || p.purchase_brand,
      ROM: p.rom,
      Battery: p.battery_health,
      "Purchase Price": p.price,
      "Net Stock": p.net_stock ?? 0,
      "Returned Qty": p.returned_qty ?? 0,
      "Total Value": (p.price || 0) * (p.net_stock ?? 0),
    }));

    data.push({}, { Product: "GRAND TOTAL", "Net Stock": grandTotalStock, "Total Value": grandTotalPrice });

    const ws = XLSX.utils.json_to_sheet(data);
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "Inventory");
    const buffer = XLSX.write(wb, { bookType: "xlsx", type: "array" });
    saveAs(new Blob([buffer]), "inventory.xlsx");
  };

  const branches = [...new Set(products.map((p) => p.branch).filter(Boolean))];
  const productNames = [...new Set(products.map((p) => p.name).filter(Boolean))];

  return (
    <div className="container-fluid px-md-10">
    
      <div className="d-flex flex-column flex-md-row justify-content-between align-items-center mb-4 p-3 p-md-4 rounded-4 shadow-sm" style={{ background: "linear-gradient(135deg, #01753b, #03a65a)", color: "white" }}>
        <div className="text-center text-md-start mb-3 mb-md-0">
          <h3 className="fw-bold mb-1"><FaBox className="me-2" /> Inventory</h3>
          <small>View available stock (Minus Returns)</small>
        </div>
        <Button variant="light" className="text-dark fw-semibold" onClick={exportExcel}>⬇ Export Excel</Button>
      </div>

     
      <div className="card border-0 shadow-sm mb-4 rounded-4">
        <div className="card-body">
          <div className="row g-2">
            <div className="col-md-4">
              <InputGroup>
                <InputGroup.Text><FaSearch /></InputGroup.Text>
                <Form.Control placeholder="Search..." value={search} onChange={(e) => { setSearch(e.target.value); setCurrentPage(1); }} />
              </InputGroup>
            </div>
            <div className="col-md-2">
                <Form.Select value={branchFilter} onChange={(e) => setBranchFilter(e.target.value)}>
                    <option value="">All Branches</option>
                    {branches.map((b, i) => <option key={i} value={b}>{b}</option>)}
                </Form.Select>
            </div>
            <div className="col-md-2">
                <Form.Select value={productFilter} onChange={(e) => setProductFilter(e.target.value)}>
                    <option value="">All Products</option>
                    {productNames.map((n, i) => <option key={i} value={n}>{n}</option>)}
                </Form.Select>
            </div>
            <div className="col-md-2"><Form.Control type="date" value={startDate} onChange={(e) => setStartDate(e.target.value)} /></div>
            <div className="col-md-2"><Form.Control type="date" value={endDate} onChange={(e) => setEndDate(e.target.value)} /></div>
          </div>
        </div>
      </div>

      <div className="card border-0 shadow-lg rounded-4 overflow-hidden">
        <div className="table-responsive">
          <Table striped hover className="align-middle mb-0" style={{ fontSize: "0.85rem", minWidth: "900px" }}>
            <thead className="table-light text-uppercase">
              <tr>
                <th>#</th>
                <th>IMEI</th>
                <th>Branch</th>
                <th>Product</th>
                <th>Brand</th>
                <th>ROM</th>
                <th>B. H.</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Total</th>
              </tr>
            </thead>
            <tbody>
              {currentProducts.map((p, i) => (
                <tr key={i}>
                  <td>{indexOfFirst + i + 1}</td>
                  <td className="fw-bold text-muted">{p.imei}</td>
                  <td>{p.branch}</td>
                  <td>{p.name}</td>
                  <td>{p.product_brand}</td>
                  <td>{p.rom}</td>
                  <td>{p.battery_health}</td>
                  <td>TK {p.price}</td>
                  <td>
                    <span className="fw-bold">{p.net_stock}</span>
                  
                    {Number(p.returned_qty) > 0 && (
                      <div className="text-danger" style={{ fontSize: '0.7rem' }}>
                         ({p.returned_qty} Returned)
                      </div>
                    )}
                  </td>
                  <td className="fw-bold text-success">TK {(p.price || 0) * (p.net_stock || 0)}</td>
                </tr>
              ))}

              <tr className="fw-semibold bg-light">
                <td colSpan="8" className="text-end pe-4 text-muted">Subtotal (Page)</td>
                <td>{subTotalStock}</td>
                <td>TK {subTotalPrice.toLocaleString()}</td>
              </tr>

              {isLastPage && (
                <tr className="fw-bold table-secondary">
                  <td colSpan="8" className="text-end pe-4">Grand Total</td>
                  <td>{grandTotalStock}</td>
                  <td>TK {grandTotalPrice.toLocaleString()}</td>
                </tr>
              )}
            </tbody>
          </Table>
        </div>

        
        <div className="bg-white border-top py-3 px-3">
          <div className="d-flex justify-content-center flex-wrap gap-2">
            <Button variant="success" size="sm" disabled={currentPage === 1} onClick={() => setCurrentPage(currentPage - 1)}>Prev</Button>
            
            <Button variant="success" size="sm" disabled={currentPage === totalPages} onClick={() => setCurrentPage(currentPage + 1)}>Next</Button>
          </div>
        </div>
      </div>
    </div>
  );
}