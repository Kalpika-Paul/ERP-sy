import React, { useState } from "react";
import { Container, Row, Col, Form, Button } from "react-bootstrap";
import { Link } from "react-router-dom";
import { FaArrowLeft } from "react-icons/fa";
import axios from "axios";

export default function Add() {
  const [formData, setFormData] = useState({
    name: "",
    brand: "",
    image: null,
  });

  const brands = [
    "Apple", "Samsung", "One Plus", "Google", "Huawei", "Motorola",
    "Oppo", "Vivo", "LG", "Redmi", "Realme", "Sony", "Nokia",
  ];

  const handleChange = (e) => {
    const { name, value, files } = e.target;
    setFormData({
      ...formData,
      [name]: files ? files[0] : value,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const requiredFields = ["name", "brand"];
    for (let field of requiredFields) {
      if (!formData[field]) {
        alert(`Please fill the ${field} field`);
        return;
      }
    }

    try {
      const data = new FormData();
      for (const key in formData) {
        const value = formData[key];
        if (!value) continue;
        if (key === "image" && value instanceof File) {
          data.append("image", value);
        } else {
          data.append(key, value);
        }
      }

      await axios.post(
        `${import.meta.env.VITE_API_URL}/api/products`,
        data,
        {
          headers: {
            "Content-Type": "multipart/form-data",
            Authorization: `Bearer ${localStorage.getItem("token")}`,
          },
        }
      );

      alert("Product Submitted Successfully!");
      setFormData({ name: "", brand: "", image: null });
    } catch (error) {
      console.error(error.response || error);
      alert(error.response?.data?.message || "Something went wrong!");
    }
  };

  return (
    <div>
     
      <Container className="mt-2 mt-md-4 mb-5">

      
        <div className="d-flex flex-column flex-sm-row justify-content-between align-items-start align-items-sm-center mb-4 gap-3">
          <h3 className="fw-bold mb-0">Add Product</h3>
          <Link to="/product" className="btn btn-dark w-100 w-sm-auto">
            <FaArrowLeft className="me-2" />
            Back To Product List
          </Link>
        </div>

      
        <Form onSubmit={handleSubmit}>
          <Row>
           
            <Col xs={12} lg={6} className="mb-3">
              <Form.Group>
                <Form.Label className="fw-semibold">Product Name</Form.Label>
                <Form.Control
                  type="text"
                  name="name"
                  placeholder="Enter product name"
                  value={formData.name}
                  onChange={handleChange}
                  required
                  className="py-2"
                />
              </Form.Group>
            </Col>

      
            <Col xs={12} lg={6} className="mb-3">
              <Form.Group>
                <Form.Label className="fw-semibold">Brand</Form.Label>
                <Form.Select
                  name="brand"
                  value={formData.brand}
                  onChange={handleChange}
                  required
                  className="py-2" 
                >
                  <option value="">Select Brand</option>
                  {brands.map((brand, index) => (
                    <option key={index} value={brand}>
                      {brand}
                    </option>
                  ))}
                </Form.Select>
              </Form.Group>
            </Col>
          </Row>

       
          <Row className="mb-4">
            <Col xs={12}>
              <Form.Group>
                <Form.Label className="fw-semibold mb-2">Upload Product Image</Form.Label>
               
                <Form.Control 
                    type="file" 
                    name="image" 
                    onChange={handleChange} 
                    id="productImage"
                    className="py-2"
                />
              </Form.Group>
            </Col>
          </Row>

      
          <Button type="submit" variant="success" className="w-100 py-3 fw-bold shadow-sm">
            Submit Product
          </Button>
        </Form>
      </Container>
    </div>
  );
}