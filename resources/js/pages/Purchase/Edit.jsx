import React, { useState, useEffect } from "react";
import { Container, Row, Col, Form, Button } from "react-bootstrap";
import { Link, useParams } from "react-router-dom";
import { FaArrowLeft } from "react-icons/fa";
import axios from "axios";
import Select from "react-select";

export default function EditPurchase() {
  const { id } = useParams();
  const [products, setProducts] = useState([]);
  const [selectedProduct, setSelectedProduct] = useState(null);
  const [oldNidImage, setOldNidImage] = useState(null);
  const [oldMemoImage, setOldMemoImage] = useState(null);

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
    battery_health:"",
  });


  const conditionOptions = ["New", "Used", "Refurbished"];

  const colorOptions = ["Black", "White", "Gold","Silver","Rose Gold","Space Gray","Midnight","StartLight",
    "Blue","Sierra Blue","Pacific Blue","Pacific Blue","Alpine Greeen","Green","Yellow","Pink","Purple",
    "Deep Purple","Coral","Natural Titanium","Blue Titanium",,"White Titanium","Phantom Black",
    "Phantom White","Phantom Silver","Phantom Violet","Phantom Pink","Phantom Gray","Phantom Navy","Phantom Green",
    "Phantom Gold","Cream","Lavender","Lime","Red","Gray","Graphite","Burgandy","Sky Blue","Ice Blue","Orange"].sort();
  const variantOptions =  ["Global", "Bangladesh", "USA", "Korean", "Japan", "India", "China", "Singapore", 
    "Malaysian", "Australia", "Denmark", "Canada", "Vietnam", "HongKong", "Brazil", "Dubai", "Canada"].sort();;
  const ramOptions = ["2GB", "3GB", "4GB", "6GB", "8GB", "12GB", "16GB"];
  const romOptions = ["16GB", "32GB", "64GB", "128GB", "256GB"];
  const boxOptions = ["Yes", "No"];

  useEffect(() => {
    fetchProducts();
    fetchPurchase();
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

  const fetchPurchase = async () => {
    try {
      const response = await axios.get(
        `${import.meta.env.VITE_API_URL}/api/purchase/${id}`,
        { headers: { Authorization: `Bearer ${localStorage.getItem("token")}` } }
      );
      const purchase = response.data.purchase;

      setFormData({
        product_id: purchase.product_id || "",
        product_name: purchase.product_name || "",
        brand: purchase.brand || "",
        branch: purchase.branch || "",
        memo: purchase.memo || "",
        month: purchase.month || "",
        supplier_name: purchase.supplier_name || "",
        contact_number: purchase.contact_number || "",
        nid_number: purchase.nid_number || "",
        quantity: purchase.quantity || 1,
        salesPrice: purchase.salesPrice || "",
        nid_image: null,
        memo_image: null,
        price: purchase.price || "",
        model: purchase.model || "",
        color: purchase.color || "",
        variant: purchase.variant || "",
        ram: purchase.ram || "",
        rom: purchase.rom || "",
        box: purchase.box || "",
        imei: purchase.imei || "",
        condition: purchase.condition || "",
        battery_health:purchase.battery_health ||"",
      });

      setSelectedProduct({
        id: purchase.product_id,
        name: purchase.product_name,
        brand: purchase.brand,
      });

      setOldNidImage(purchase.nid_image);
      setOldMemoImage(purchase.memo_image);
    } catch (error) {
      console.error(error);
      alert("Failed to load purchase");
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
    if (!formData.product_id || !formData.branch || !formData.month || !formData.supplier_name || !formData.contact_number || !formData.nid_number) {
      alert("Please fill all required fields!");
      return;
    }

    try {
      const data = new FormData();
      Object.keys(formData).forEach((key) => {
        if (formData[key] !== null && formData[key] !== "") data.append(key, formData[key]);
      });

      const response = await axios.post(
        `${import.meta.env.VITE_API_URL}/api/purchase/${id}?_method=PUT`,
        data,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem("token")}`,
            "Content-Type": "multipart/form-data",
          },
        }
      );

      alert(response.data.message || "Purchase updated successfully!");
    } catch (error) {
      console.error(error.response || error);
      alert(error.response?.data?.errors ? JSON.stringify(error.response.data.errors) : "Update failed!");
    }
  };

  return (
    <Container>
      <div className="d-flex justify-content-between align-items-center mb-4">
        <h3 className="fw-bold">Edit Purchase</h3>
        <Link to="/purchase" className="btn btn-dark d-flex align-items-center">
          <FaArrowLeft className="me-2" /> Back To Purchase List
        </Link>
      </div>

      <Form onSubmit={handleSubmit}>
        {/* Product Select */}
        <Row className="mb-3">
          <Col md={12}>
            <Form.Group>
              <Form.Label>Select Product</Form.Label>
              <Select
                value={
                  selectedProduct
                    ? {
                      value: selectedProduct.id,
                      label: `${selectedProduct.name} - ${selectedProduct.brand}`,
                    }
                    : null
                }
                onChange={(selected) =>
                  handleProductSelect(selected ? selected.value : null)
                }
                options={products.map((p) => ({
                  value: p.id,
                  label: `${p.name} - ${p.brand}`,
                }))}
                placeholder="Search and select a product..."
                isClearable
              />
            </Form.Group>
          </Col>
        </Row>


        <Row className="mb-3">
          <Col md={4}>
            <Form.Group>
              <Form.Label>Product Name</Form.Label>
              <Form.Control
                name="product_name"
                value={formData.product_name}
                onChange={handleChange}
                required
              />
            </Form.Group>
          </Col>
          <Col md={4}>
            <Form.Group>
              <Form.Label>Brand</Form.Label>
              <Form.Control
                name="brand"
                value={formData.brand}
                onChange={handleChange}
                required
              />
            </Form.Group>
          </Col>
          <Col md={4}>
            <Form.Group>
              <Form.Label>Condition</Form.Label>
              <Form.Select name="condition" value={formData.condition} onChange={handleChange}>
                <option value="">Select Condition</option>
                {conditionOptions.map((opt, i) => (
                  <option key={i} value={opt}>{opt}</option>
                ))}
              </Form.Select>
            </Form.Group>
          </Col>
        </Row>


        <Row className="mb-3">
    
          <Col md={4}>
            <Form.Group>
              <Form.Label>Purchase Price</Form.Label>
              <Form.Control
                name="price"
                value={formData.price}
                onChange={handleChange}
              />
            </Form.Group>
          </Col>
          <Col md={4}>
            <Form.Group>
              <Form.Label>Color</Form.Label>
              <Form.Select name="color" value={formData.color} onChange={handleChange}>
                <option value="">Select Color</option>
                {colorOptions.map((opt, i) => <option key={i} value={opt}>{opt}</option>)}
              </Form.Select>
            </Form.Group>
          </Col>
          <Col md={4}>
            <Form.Group>
              <Form.Label>Variant</Form.Label>
              <Form.Select name="variant" value={formData.variant} onChange={handleChange}>
                <option value="">Select Variant</option>
                {variantOptions.map((opt, i) => <option key={i} value={opt}>{opt}</option>)}
              </Form.Select>
            </Form.Group>
          </Col>
        </Row>


        <Row className="mb-3">

          <Col md={4}>
            <Form.Group>
              <Form.Label>RAM</Form.Label>
              <Form.Select name="ram" value={formData.ram} onChange={handleChange}>
                <option value="">Select RAM</option>
                {ramOptions.map((opt, i) => <option key={i} value={opt}>{opt}</option>)}
              </Form.Select>
            </Form.Group>
          </Col>
          <Col md={4}>
            <Form.Group>
              <Form.Label>ROM</Form.Label>
              <Form.Select name="rom" value={formData.rom} onChange={handleChange}>
                <option value="">Select ROM</option>
                {romOptions.map((opt, i) => <option key={i} value={opt}>{opt}</option>)}
              </Form.Select>
            </Form.Group>
          </Col><Col md={4}>
            <Form.Group>
              <Form.Label>Box</Form.Label>
              <Form.Select name="box" value={formData.box} onChange={handleChange}>
                <option value="">Select Box</option>
                {boxOptions.map((opt, i) => <option key={i} value={opt}>{opt}</option>)}
              </Form.Select>
            </Form.Group>
          </Col>
        </Row>

      
        <Row className="mb-3">

          <Col md={3}>
            <Form.Group>
              <Form.Label>IMEI</Form.Label>
              <Form.Control
                name="imei"
                value={formData.imei}
                onChange={handleChange}
              />
            </Form.Group>
          </Col>
          <Col md={3}>
            <Form.Group>
              <Form.Label>Quantity</Form.Label>
              <Form.Control
                type="number"
                name="quantity"
                value={formData.quantity || ""}
                onChange={handleChange}
                placeholder="Enter Quantity"

              />
            </Form.Group>
          </Col>
          <Col md={3}>
            <Form.Group>
              <Form.Label>Battery Health Percentage</Form.Label>
              <Form.Control
                name="battery_health"
                value={formData.battery_health || ""}
                onChange={handleChange}
              />
            </Form.Group>
          </Col>
          <Col md={3}>
            <Form.Group>
              <Form.Label>Set Sale Price</Form.Label>
              <Form.Control
                name="salesPrice"
                value={formData.salesPrice || ""}
                onChange={handleChange}
                placeholder="Enter sale price"
                style={{ borderColor: "orange", borderWidth: "2px" }}
              />
            </Form.Group>
          </Col>
        </Row>


        <Row className="mb-3">
          <Col md={6}>
            <Form.Group>
              <Form.Label>Branch</Form.Label>
              <Form.Select
                name="branch"
                value={formData.branch}
                onChange={handleChange}
                required
              >
                <option value="">Select Branch</option>
                <option>WareHouse</option>
                <option>Eastern Plaza</option>
                <option>Motalib Plaza</option>
                <option>Bashundhara City</option>
                <option>Gulistan Shopping Complex</option>
                <option>Jamuna Future Park</option>
              </Form.Select>
            </Form.Group>
          </Col>
          <Col md={6}>
            <Form.Group>
              <Form.Label>Date</Form.Label>
              <Form.Control
                type="date"
                name="month"
                value={formData.month}
                onChange={handleChange}
                required
              />
            </Form.Group>
          </Col>
        </Row>


        <Row className="mb-3">
          <Col md={6}>
            <Form.Group>
              <Form.Label>Supplier Name</Form.Label>
              <Form.Control
                name="supplier_name"
                value={formData.supplier_name}
                onChange={handleChange}
                required
              />
            </Form.Group>
          </Col>
          <Col md={6}>
            <Form.Group>
              <Form.Label>Contact Number</Form.Label>
              <Form.Control
                name="contact_number"
                value={formData.contact_number}
                onChange={handleChange}
                required
              />
            </Form.Group>
          </Col>
        </Row>


        <Row className="mb-3">
          <Col md={6}>
            <Form.Group>
              <Form.Label>NID Number</Form.Label>
              <Form.Control
                name="nid_number"
                value={formData.nid_number}
                onChange={handleChange}
                required
              />
              {oldNidImage && (
                <img
                  src={oldNidImage}
                  alt="Old NID"
                  width="120"
                  className="mt-2"
                />
              )}
            </Form.Group>
          </Col>
          <Col md={6}>
            <Form.Group>
              <Form.Label>Purchase Memo</Form.Label>
              <Form.Control
                type="number"
                name="memo"
                value={formData.memo}
                onChange={handleChange}
                required
              />
              {oldMemoImage && (
                <img
                  src={oldMemoImage}
                  alt="Old Memo"
                  width="120"
                  className="mt-2"
                />
              )}
            </Form.Group>
          </Col>
        </Row>


        <Row className="mb-4">
          <Col md={6}>
            <Form.Group>
              <Form.Label>Upload Supplier's NID</Form.Label>
              <Form.Control
                type="file"
                name="nid_image"
                accept="image/*"
                onChange={handleChange}
              />
            </Form.Group>
          </Col>
          <Col md={6}>
            <Form.Group>
              <Form.Label>Upload Purchase Memo</Form.Label>
              <Form.Control
                type="file"
                name="memo_image"
                accept="image/*"
                onChange={handleChange}
              />
            </Form.Group>
          </Col>
        </Row>

        <Button type="submit" variant="success" className="w-100">
          Update
        </Button>
      </Form>
    </Container>
  );
}