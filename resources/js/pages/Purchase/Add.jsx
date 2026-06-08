import React, { useState, useEffect } from "react";
import { Container, Row, Col, Form, Button } from "react-bootstrap";
import { Link } from "react-router-dom";
import { FaArrowLeft } from "react-icons/fa";
import axios from "axios";
import Select from "react-select";

export default function AddPurchase() {
  const [products, setProducts] = useState([]);
  const [selectedProduct, setSelectedProduct] = useState(null);
  const [formData, setFormData] = useState({
    product_id: "",
    product_name: "",
    brand: "",
    branch: "",
    memo: "",
    month: "",
    supplier_name: "",
    contact_number: "",
    nid_number: "",
    quantity: 1,
    salesPrice: "",
    nid_image: null,
    memo_image: null,
    price: "",
    model: "",
    color: "",
    variant: "",
    ram: "",
    rom: "",
    box: "",
    imei: "",
    condition: "",
    battery_health: "",
  });

  useEffect(() => {
    fetchProducts();
  }, []);

  const fetchProducts = async () => {
    try {
      const response = await axios.get(
        `${import.meta.env.VITE_API_URL}/api/products`,
        { headers: { Authorization: `Bearer ${localStorage.getItem("token")}` } }
      );
      setProducts(response.data.products || response.data);
    } catch (error) {
      console.error(error);
      alert("Failed to load products");
    }
  };

  const handleProductSelect = (productId) => {
    if (!productId) {
      setSelectedProduct(null);
      setFormData((prev) => ({ ...prev, product_id: "", product_name: "", brand: "" }));
      return;
    }
    const product = products.find((p) => p.id === productId);
    if (product) {
      setSelectedProduct(product);
      setFormData((prev) => ({
        ...prev,
        product_id: product.id,
        product_name: product.name,
        brand: product.brand,
      }));
    }
  };

  const handleChange = (e) => {
    const { name, value, files } = e.target;
    setFormData((prev) => ({ ...prev, [name]: files ? files[0] : value }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (
      !formData.product_id ||
      !formData.branch ||
      !formData.month ||
      !formData.supplier_name ||
      !formData.contact_number ||
      !formData.nid_number ||
      !formData.nid_image
    ) {
      alert("Please fill all required fields!");
      return;
    }

    try {
      const data = new FormData();
      for (const key in formData) {
        if (formData[key] !== null && formData[key] !== "") {
          data.append(key, formData[key]);
        }
      }

      const response = await axios.post(
        `${import.meta.env.VITE_API_URL}/api/purchase`,
        data,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem("token")}`,
            "Content-Type": "multipart/form-data",
          },
        }
      );

      alert(response.data.message || "Purchase submitted successfully!");
      setSelectedProduct(null);
      setFormData({
        product_id: "",
        product_name: "",
        brand: "",
        branch: "",
        memo: "",
        month: "",
        supplier_name: "",
        contact_number: "",
        nid_number: "",
        quantity: 1,
        salesPrice: "",
        nid_image: null,
        memo_image: null,
        price: "",
        model: "",
        color: "",
        variant: "",
        ram: "",
        rom: "",
        box: "",
        imei: "",
        condition: "",
        battery_health: "",
      });
    } catch (error) {
      console.error(error.response || error);
      alert(
        error.response?.data?.errors
          ? JSON.stringify(error.response.data.errors)
          : "Purchase failed!"
      );
    }
  };


  const conditionOptions = ["Pre-Owned", "New"];
  const colorOptions = [
    "Black","White","Gold","Silver","Rose Gold","Space Gray","Midnight","StartLight",
    "Blue","Sierra Blue","Pacific Blue","Alpine Green","Green","Yellow","Pink","Purple",
    "Deep Purple","Coral","Natural Titanium","Blue Titanium","White Titanium","Phantom Black",
    "Phantom White","Phantom Silver","Phantom Violet","Phantom Pink","Phantom Gray","Phantom Navy",
    "Phantom Green","Phantom Gold","Cream","Lavender","Lime","Red","Gray","Graphite","Burgandy",
    "Sky Blue","Ice Blue","Orange"
  ].sort();
  const variantOptions = ["Global","Bangladesh","USA","Korean","Japan","India","China","Singapore","Malaysian","Australia","Denmark","Canada","Vietnam","HongKong","Brazil","Dubai"].sort();
  const ramOptions = ["2GB","3GB","4GB","6GB","8GB","12GB","16GB","18GB","1TB","2TB"];
  const romOptions = ["32GB","64GB","128GB","256GB","512GB","1TB","2TB"];
  const boxOptions = ["Yes","No"];

  return (
    <Container>
      <div className="d-flex flex-column flex-sm-row justify-content-between align-items-start align-items-sm-center mb-4">
        <h3 className="fw-bold mb-3 mb-sm-0">Add Purchase</h3>
        <Link to="/purchase" className="btn btn-dark d-flex align-items-center">
          <FaArrowLeft className="me-2" /> Back To Purchase List
        </Link>
      </div>

      <Form onSubmit={handleSubmit}>
        <Row className="mb-3">
          <Col xs={12}>
            <Form.Group>
              <Form.Label>Select Product</Form.Label>
              <Select
                value={selectedProduct ? { value: selectedProduct.id, label: `${selectedProduct.name} - ${selectedProduct.brand}` } : null}
                onChange={(selected) => handleProductSelect(selected ? selected.value : null)}
                options={products.map((p) => ({ value: p.id, label: `${p.name} - ${p.brand}` }))}
                placeholder="Search and select a product..."
                isClearable
              />
            </Form.Group>
          </Col>
        </Row>

       
        <Row className="mb-3">
          {[
            { label: "Product Name", name: "product_name", type: "text" },
            { label: "Brand", name: "brand", type: "text" },
            { label: "Condition", name: "condition", type: "select", options: conditionOptions },
            { label: "Purchase Price", name: "price", type: "text" },
            { label: "Color", name: "color", type: "select", options: colorOptions },
            { label: "Variant", name: "variant", type: "select", options: variantOptions },
            { label: "RAM", name: "ram", type: "select", options: ramOptions },
            { label: "ROM", name: "rom", type: "select", options: romOptions },
            { label: "Box", name: "box", type: "select", options: boxOptions },
            { label: "Battery Health (%)", name: "battery_health", type: "text" },
            { label: "IMEI", name: "imei", type: "text" },
            { label: "Quantity", name: "quantity", type: "number" },
            { label: "Branch", name: "branch", type: "select", options: ["WareHouse","Eastern Plaza","Motalib Plaza","Bashundhara City","Gulistan Shopping Complex","Jamuna Future Park"] },
            { label: "Date", name: "month", type: "date" },
            { label: "Supplier Name", name: "supplier_name", type: "text" },
            { label: "Contact Number", name: "contact_number", type: "text" },
            { label: "NID Number", name: "nid_number", type: "text" },
            { label: "Purchase Memo", name: "memo", type: "number" }
          ].map((field, i) => (
            <Col xs={12} lg={6} key={i} className="mb-3">
              <Form.Group>
                <Form.Label>{field.label}</Form.Label>
                {field.type === "select" ? (
                  <Form.Select name={field.name} value={formData[field.name]} onChange={handleChange}>
                    <option value="">Select {field.label}</option>
                    {field.options?.map((opt, idx) => (<option key={idx} value={opt}>{opt}</option>))}
                  </Form.Select>
                ) : (
                  <Form.Control type={field.type} name={field.name} value={formData[field.name]} onChange={handleChange} />
                )}
              </Form.Group>
            </Col>
          ))}

 
          <Col xs={12} lg={6} className="mb-3">
            <Form.Group>
              <Form.Label>Upload Supplier's NID</Form.Label>
              <Form.Control type="file" name="nid_image" accept="image/*" onChange={handleChange} required />
            </Form.Group>
          </Col>
          <Col xs={12} lg={6} className="mb-3">
            <Form.Group>
              <Form.Label>Upload Purchase Memo</Form.Label>
              <Form.Control type="file" name="memo_image" accept="image/*" onChange={handleChange} />
            </Form.Group>
          </Col>
        </Row>

        <Button type="submit" variant="success" className="w-100 mb-5 py-2">
          Submit
        </Button>
      </Form>
    </Container>
  );
}