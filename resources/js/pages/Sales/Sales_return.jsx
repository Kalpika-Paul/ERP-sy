// this is sales return form

import React, { useState } from "react";
import {
  Container,
  Form,
  Button,
  Card,
  Badge,
  InputGroup,
  Spinner,
} from "react-bootstrap";
import { Link } from "react-router-dom";
import {
  FaArrowLeft,
  FaSearch,
  FaUndo,
  FaCheckCircle,
} from "react-icons/fa";
import axios from "axios";

export default function ReturnSale() {
  const [search, setSearch] = useState("");
  const [salesList, setSalesList] = useState([]);
  const [selectedItem, setSelectedItem] = useState(null);
  const [note, setNote] = useState("");
  const [loading, setLoading] = useState(false);
  const [submitting, setSubmitting] = useState(false);

  const token = localStorage.getItem("token");

  
  const fetchSales = async (searchValue = "") => {
    if (!searchValue.trim()) return;
    setLoading(true);

    try {
      const res = await axios.get(
        `${import.meta.env.VITE_API_URL}/api/sale-return/search?search=${searchValue}`,
        { headers: { Authorization: `Bearer ${token}` } }
      );

      setSalesList(res.data.sales || []);
    } catch (err) {
      console.error(err);
      alert("Error searching sales");
    } finally {
      setLoading(false);
    }
  };

  const handleSelect = (item) => {
    setSelectedItem(item);
    setSalesList([]);
    setSearch("");
    setNote("");
  };

  
  const handleReturn = async () => {
    if (!selectedItem) return;

    if (!note.trim()) {
      alert("Please provide a reason.");
      return;
    }

    setSubmitting(true);

    try {
      const res = await axios.post(
        `${import.meta.env.VITE_API_URL}/api/sale-return/${selectedItem.id}`,
        {
          note: note,
        },
        { headers: { Authorization: `Bearer ${token}` } }
      );

      alert(res.data.message || "Returned successfully");

      setSelectedItem(null);
      setNote("");
    } catch (err) {
      alert(err.response?.data?.message || "Failed");
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <Container className="py-4">

      <div className="d-flex justify-content-between mb-4">
        <h3 className="fw-bold text-success">
          <FaUndo /> Return Sale
        </h3>
        <Link to="/sales-return" className="btn btn-outline-dark">
          <FaArrowLeft /> Back
        </Link>
      </div>

    
      <Card className="mb-4 shadow-sm">
        <Card.Body>
          <Form
            onSubmit={(e) => {
              e.preventDefault();
              fetchSales(search);
            }}
          >
            <InputGroup>
              <Form.Control
                placeholder="Search IMEI / Brand"
                value={search}
                onChange={(e) => setSearch(e.target.value)}
              />
              <Button type="submit">
                {loading ? <Spinner size="sm" /> : <FaSearch />}
              </Button>
            </InputGroup>
          </Form>
        </Card.Body>
      </Card>

      
      {salesList.map((item) => (
        <Card
          key={item.id}
          className="mb-2 shadow-sm"
          style={{ cursor: "pointer" }}
          onClick={() => handleSelect(item)}
        >
          <Card.Body className="d-flex justify-content-between">
            <div>
              <b>{item.product_name}</b>
              <br />
              <small>
                IMEI: {item.imei} | {item.brand}
              </small>
            </div>
            <Badge bg="info">Qty: {item.quantity}</Badge>
          </Card.Body>
        </Card>
      ))}

   
      {selectedItem && (
        <Card className="shadow-lg mt-4">
          <div className="bg-success text-white p-3">
            <h5 className="mb-0 fw-bold">
              {selectedItem.product_name}
            </h5>
            <small>IMEI: {selectedItem.imei}</small>
          </div>

          <Card.Body>
       
            <div className="row text-center mb-4">
              <div className="col">
                <b>Quantity</b>
                <h5>{selectedItem.quantity}</h5>
              </div>
              <div className="col">
                <b>Price</b>
                <h5>{selectedItem.price}</h5>
              </div>
              <div className="col">
                <b>Branch</b>
                <h6>{selectedItem.branch}</h6>
              </div>
            </div>

            <Card className="mb-4 shadow-sm">
              <Card.Body>
                <h6 className="fw-bold text-success mb-3">
                  Product Details
                </h6>

                <div className="row">
                  <div className="col-md-6">Brand: {selectedItem.brand}</div>
                  <div className="col-md-6">RAM: {selectedItem.ram}</div>
                  <div className="col-md-6">ROM: {selectedItem.rom}</div>
                  <div className="col-md-6">Color: {selectedItem.color}</div>
                  <div className="col-md-6">
                    Condition: {selectedItem.condition}
                  </div>
                  <div className="col-md-6">
                    Customer: {selectedItem.customer_name}
                  </div>
                  <div className="col-md-6">
                    Phone: {selectedItem.customer_phone}
                  </div>
                </div>
              </Card.Body>
            </Card>

            <Form.Group className="mb-3">
              <Form.Label>Return Note</Form.Label>
              <Form.Control
                as="textarea"
                rows={3}
                value={note}
                onChange={(e) => setNote(e.target.value)}
              />
            </Form.Group>

          
            <Button
              className="w-100"
              onClick={handleReturn}
              disabled={submitting}
            >
              {submitting ? (
                <Spinner size="sm" />
              ) : (
                <>
                  <FaCheckCircle /> Confirm Return
                </>
              )}
            </Button>
          </Card.Body>
        </Card>
      )}
    </Container>
  );
}