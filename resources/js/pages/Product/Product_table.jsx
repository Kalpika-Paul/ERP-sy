import React, { useState, useEffect } from "react";
import { Table, Form, InputGroup, Button, Container, Row, Col } from "react-bootstrap";
import { Link } from "react-router-dom";
import { FaPlus, FaSearch, FaTimes, FaDownload } from "react-icons/fa";
import axios from "axios";
import * as XLSX from "xlsx";
import { saveAs } from "file-saver";

export default function ProductTable() {
  const [products, setProducts] = useState([]);
  const [search, setSearch] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 10;
  const user = JSON.parse(localStorage.getItem("user") || "{}");

  const fetchProducts = async () => {
    try {
      const response = await axios.get(`${import.meta.env.VITE_API_URL}/api/products`, {
        headers: { Authorization: `Bearer ${localStorage.getItem("token")}` },
      });
      setProducts(response.data.products || response.data);
    } catch (error) {
      console.error(error);
      alert("Failed to load products");
    }
  };

  useEffect(() => {
    document.title = "Product Management | Dashboard";
    fetchProducts();
  }, []);

  const handleDelete = (id) => {
    if (window.confirm("Are you sure you want to delete this product?")) {
      axios
        .delete(`${import.meta.env.VITE_API_URL}/api/products/${id}`, {
          headers: { Authorization: `Bearer ${localStorage.getItem("token")}` },
        })
        .then(() => fetchProducts())
        .catch((err) => console.error(err.response?.data || err));
    }
  };

  const searchTerm = search.trim().toLowerCase();

  const filteredProducts = products
    .filter((p) => {
      if (!searchTerm) return true;
      return Object.values(p).some(
        (value) =>
          value !== null &&
          value !== undefined &&
          String(value).toLowerCase().includes(searchTerm)
      );
    })
    .sort((a, b) => b.id - a.id);

  const indexOfLast = currentPage * itemsPerPage;
  const indexOfFirst = indexOfLast - itemsPerPage;
  const currentProducts = filteredProducts.slice(indexOfFirst, indexOfLast);
  const totalPages = Math.ceil(filteredProducts.length / itemsPerPage);

  const exportToExcel = () => {
    const excelData = filteredProducts.map((p, index) => ({
      SL: index + 1,
      Name: p.name,
      Brand: p.brand,
      ImageURL: p.image_url || "-",
    }));

    const worksheet = XLSX.utils.json_to_sheet(excelData);
    const workbook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(workbook, worksheet, "Products");
    const excelBuffer = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
    const data = new Blob([excelBuffer], {
      type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    });
    saveAs(data, "products.xlsx");
  };

  return (
    <Container fluid className=" px-md-10 ">
      <div
        className="p-4 rounded-4 shadow-sm mb-4"
        style={{ background: "linear-gradient(135deg, #01753b, #03a65a)", color: "white" }}
      >
        <Row className="align-items-center g-3">
          <Col xs={12} md={6} className="text-center text-md-start">
            <h3 className="fw-bold mb-1">Product Management</h3>
            <small className="opacity-75">Manage all your products in one place</small>
          </Col>
          <Col xs={12} md={6} className="d-flex justify-content-center justify-content-md-end gap-2">
            <Link
              to="/product/add"
              className="btn btn-light fw-semibold d-flex align-items-center shadow-sm"
              style={{ borderRadius: "10px" }}
            >
              <FaPlus className="me-2" /> <span className="d-none d-sm-inline">Add Product</span>
              <span className="d-inline d-sm-none">Add</span>
            </Link>
            <Button variant="light" className="fw-semibold shadow-sm" onClick={exportToExcel} style={{ borderRadius: "10px" }}>
              <FaDownload className="me-1" /> <span className="d-none d-sm-inline">Export Excel</span>
              <span className="d-inline d-sm-none">Export</span>
            </Button>
          </Col>
        </Row>
      </div>

     
      <Row className="mb-4">
        <Col xs={12} lg={12} xl={12}>
          <div className="card border-0 shadow-sm rounded-4">
            <div className="card-body p-2">
              <InputGroup>
                <InputGroup.Text className="bg-transparent border-0">
                  <FaSearch className="text-muted" />
                </InputGroup.Text>
                <Form.Control
                  placeholder="Search products..."
                  value={search}
                  onChange={(e) => {
                    setSearch(e.target.value);
                    setCurrentPage(1);
                  }}
                  className="border-0 shadow-none"
                />
                {search && (
                  <Button
                    variant="link"
                    onClick={() => setSearch("")}
                    className="text-muted text-decoration-none"
                  >
                    <FaTimes />
                  </Button>
                )}
              </InputGroup>
            </div>
          </div>
        </Col>
      </Row>

   
      <div className="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div className="table-responsive">
          <Table hover striped className="align-middle mb-0">
            <thead className="bg-light">
              <tr style={{ fontSize: "13px", color: "#555" }}>
                <th className="text-center py-3">#</th>
                <th className="py-3">Name</th>
                <th className="text-center py-3">Brand</th>
                <th className="text-center py-3">Image</th>
                {user?.type === "admin" && <th className="text-center py-3">Actions</th>}
              </tr>
            </thead>
            <tbody>
              {currentProducts.length ? (
                currentProducts.map((product, index) => (
                  <tr key={product.id}>
                    <td className="text-center text-muted">{indexOfFirst + index + 1}</td>
                    <td className="fw-semibold text-dark">{product.name}</td>
                    <td className="text-center">{product.brand}</td>
                    <td className="text-center">
                      {product.image_url ? (
                        <img
                          src={product.image_url}
                          alt={product.name}
                          width="45"
                          height="45"
                          className="rounded-3 shadow-sm object-fit-cover"
                        />
                      ) : (
                        <span className="text-muted small">N/A</span>
                      )}
                    </td>
                    {user?.type === "admin" && (
                      <td className="text-center">
                        <div className="d-flex justify-content-center gap-2">
                          <Link
                            to={`/product/edit/${product.id}`}
                            className="btn btn-sm btn-outline-success px-3 rounded-pill"
                          >
                            Edit
                          </Link>
                          <Button
                            variant="outline-danger"
                            size="sm"
                            className="px-3 rounded-pill"
                            onClick={() => handleDelete(product.id)}
                          >
                            Delete
                          </Button>
                        </div>
                      </td>
                    )}
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan="5" className="text-center py-5 text-muted">
                    <div className="d-flex flex-column align-items-center">
                      <span className="fs-2">🔍</span>
                      <p className="mt-2 mb-0">No products found matching your search.</p>
                    </div>
                  </td>
                </tr>
              )}
            </tbody>
          </Table>
        </div>

   
        {totalPages > 1 && (
          <div className="card-footer bg-white border-0 py-4">
            <div className="d-flex justify-content-center align-items-center gap-2 flex-wrap">
              <Button
                variant="outline-secondary"
                disabled={currentPage === 1}
                onClick={() => setCurrentPage((prev) => prev - 1)}
                className="rounded-pill px-3"
                size="sm"
              >
                Prev
              </Button>
              <div className="d-flex gap-1 flex-wrap justify-content-center">
                {[...Array(totalPages)].map((_, i) => (
                  <Button
                    key={i}
                    variant={currentPage === i + 1 ? "success" : "outline-success"}
                    className="rounded-circle p-0"
                    style={{ width: "32px", height: "32px", fontSize: "14px" }}
                    onClick={() => setCurrentPage(i + 1)}
                  >
                    {i + 1}
                  </Button>
                ))}
              </div>
              <Button
                variant="outline-secondary"
                disabled={currentPage === totalPages}
                onClick={() => setCurrentPage((prev) => prev + 1)}
                className="rounded-pill px-3"
                size="sm"
              >
                Next
              </Button>
            </div>
          </div>
        )}
      </div>
    </Container>
  );
}