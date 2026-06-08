import React, { useState, useEffect } from "react";
import { Container, Row, Col, Form, Button } from "react-bootstrap";
import { Link, useParams, useNavigate } from "react-router-dom";
import { FaArrowLeft } from "react-icons/fa";
import axios from "axios";

export default function Edit() {
  const brands = [
    "Apple", "Samsung", "One Plus", "Google", "Huawei", "Motorola",
    "Oppo", "Vivo", "LG", "Redmi", "Realme", "Sony", "Nokia",
  ];
  const { id } = useParams();
  const navigate = useNavigate();

  const [formData, setFormData] = useState({
    name: "",
    brand: "",
    condition: "",
    model: "",
    color: "",
    variant: "",
    ram: "",
    rom: "",
    box: "",
    imei: "",
    quantity: "",
    price: "",
    image: null,
    existingImage: null,
  });

  const [loading, setLoading] = useState(true);

  useEffect(() => {
    axios
      .get(`${import.meta.env.VITE_API_URL}/api/products/${id}`, {
        headers: { Authorization: `Bearer ${localStorage.getItem("token")}` },
      })
      .then((res) => {
        const data = res.data.product || res.data;
        setFormData({
          ...data,
          image: null,
          existingImage: data.image_url || null,
        });
        setLoading(false);
      })
      .catch((err) => {
        console.error(err.response?.data || err);
        alert("Failed to load product data");
        setLoading(false);
      });
  }, [id]);

  const handleChange = (e) => {
    const { name, value, files } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: name === "image" ? files[0] : value,
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const data = new FormData();
      for (const key in formData) {
        if (key === "existingImage") continue;
        if (key === "price" || key === "quantity") {
          data.append(key, Number(formData[key]));
        } else if (key === "image" && formData[key] instanceof File) {
          data.append("image", formData[key]);
        } else {
          data.append(key, formData[key] || "");
        }
      }

      await axios.post(
        `${import.meta.env.VITE_API_URL}/api/products/${id}?_method=PUT`,
        data,
        {
          headers: {
            "Content-Type": "multipart/form-data",
            Authorization: `Bearer ${localStorage.getItem("token")}`,
          },
        }
      );

      alert("Product Updated Successfully!");
      navigate("/product");
    } catch (error) {
      console.error(error.response || error);
      if (error.response?.status === 401) {
        alert("Token expired. Please login again.");
        localStorage.removeItem("token");
        navigate("/login");
      } else {
        alert("Something went wrong!");
      }
    }
  };

  if (loading) return <p className="text-center mt-5">Loading...</p>;

  return (
    <div>
      <Container className="py-4">
        
        <div className="d-flex flex-column flex-sm-row justify-content-between align-items-start align-items-sm-center mb-4 gap-3">
          <h3 className="fw-bold mb-0">Edit Product</h3>
          <Link to="/product" className="btn btn-dark d-flex align-items-center w-100 w-sm-auto justify-content-center">
            <FaArrowLeft className="me-2" /> Back To Product List
          </Link>
        </div>

        <Form onSubmit={handleSubmit}>
          <Row>
         
            <Col xs={12} md={6} className="mb-3">
              <Form.Group>
                <Form.Label className="fw-semibold">Product Name</Form.Label>
                <Form.Control
                  type="text"
                  name="name"
                  value={formData.name}
                  onChange={handleChange}
                  className="shadow-sm py-2"
                  required
                />
              </Form.Group>
            </Col>

      
            <Col xs={12} md={6} className="mb-3">
              <Form.Group>
                <Form.Label className="fw-semibold">Brand</Form.Label>
                <Form.Select
                  name="brand"
                  value={formData.brand}
                  onChange={handleChange}
                  className="shadow-sm py-2"
                  required
                >
                  <option value="">Select Brand</option>
                  {brands.map((brand, index) => (
                    <option key={index} value={brand}>{brand}</option>
                  ))}
                </Form.Select>
              </Form.Group>
            </Col>

           

   

            

 
            <Col xs={12} className="mb-4">
              <Form.Group>
                <Form.Label className="fw-semibold">Upload Image</Form.Label>
                <Form.Control type="file" name="image" onChange={handleChange} className="shadow-sm py-2" />
              </Form.Group>
              {formData.existingImage && (
                <div className="mt-2">
                  <small className="d-block text-muted mb-1">Current Image:</small>
                  <img src={formData.existingImage} alt="Current" width="80" className="rounded border" />
                </div>
              )}
            </Col>
          </Row>

          <Button type="submit" variant="success" className="w-100 py-3 fw-bold shadow-sm">
            Update Product
          </Button>
        </Form>
      </Container>
    </div>
  );
}