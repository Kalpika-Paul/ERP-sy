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

export default function ReturnPurchase() {
  const [search, setSearch] = useState("");
  const [purchaseList, setPurchaseList] = useState([]);
  const [selectedPurchase, setSelectedPurchase] = useState(null);
  const [returnQuantity, setReturnQuantity] = useState(1);
  const [note, setNote] = useState("");
  const [loading, setLoading] = useState(false);
  const [submitting, setSubmitting] = useState(false);

  const token = localStorage.getItem("token");


  const fetchPurchases = async (searchValue = "") => {
    if (!searchValue.trim()) return;
    setLoading(true);
    try {
      const res = await axios.get(
        `${import.meta.env.VITE_API_URL}/api/purchase-return?search=${searchValue}`,
        { headers: { Authorization: `Bearer ${token}` } }
      );

      setPurchaseList(res.data.purchases || []);
    } catch (err) {
      console.error(err);
      alert("Error searching purchases");
    } finally {
      setLoading(false);
    }
  };

  const handleSelectPurchase = (item) => {
    setSelectedPurchase(item);
    setPurchaseList([]);
    setSearch("");
    setReturnQuantity(1);
    setNote("");
  };


  const handleReturn = async () => {
    if (!selectedPurchase) return;

    if (
      returnQuantity < 1 ||
      returnQuantity > selectedPurchase.available_stock
    ) {
      alert(
        `Invalid quantity. Max available is ${selectedPurchase.available_stock}`
      );
      return;
    }

    if (!note.trim()) {
      alert("Please provide a reason.");
      return;
    }

    setSubmitting(true);

    try {
      const res = await axios.post(
        `${import.meta.env.VITE_API_URL}/api/purchase-return/${selectedPurchase.id}`,
        {
          available_stock: returnQuantity,
          note: note,
        },
        { headers: { Authorization: `Bearer ${token}` } }
      );

      alert(res.data.message || "Returned successfully");

      setSelectedPurchase(null);
      setReturnQuantity(1);
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
          <FaUndo /> Return Purchase
        </h3>
        <Link to="/purchase-return" className="btn btn-outline-dark">
          <FaArrowLeft /> Back
        </Link>
      </div>

  
      <Card className="mb-4 shadow-sm">
        <Card.Body>
          <Form
            onSubmit={(e) => {
              e.preventDefault();
              fetchPurchases(search);
            }}
          >
            <InputGroup>
              <Form.Control
                placeholder="Search IMEI / Model / Brand"
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

      {purchaseList.map((item) => (
        <Card
          key={item.id}
          className="mb-2 shadow-sm"
          style={{ cursor: "pointer" }}
          onClick={() => handleSelectPurchase(item)}
        >
          <Card.Body className="d-flex justify-content-between">
            <div>
              <b>{item.product_name || "No Name"}</b> - {item.model || "-"}
              <br />
              <small>
                IMEI: {item.imei || "-"} | {item.brand || "-"}
              </small>
            </div>
            <Badge bg="success">Stock: {item.available_stock}</Badge>
          </Card.Body>
        </Card>
      ))}


      {selectedPurchase && (
        <Card className="shadow-lg mt-4">
      
          <div className="bg-success text-white p-3">
            <h5 className="mb-0 fw-bold">
              {selectedPurchase.product_name || "No Product"}
            </h5>
            <small>IMEI: {selectedPurchase.imei || "-"}</small>
          </div>

          <Card.Body>
           
            <div className="row text-center mb-4">
              <div className="col">
                <b>Stock</b>
                <h5>{selectedPurchase.available_stock}</h5>
              </div>
              <div className="col">
                <b>Price</b>
                <h5>${selectedPurchase.price || 0}</h5>
              </div>
              <div className="col">
                <b>Branch</b>
                <h6>{selectedPurchase.branch || "-"}</h6>
              </div>
            </div>

          
            <Card className="mb-4 shadow-sm">
              <Card.Body>
                <h6 className="fw-bold text-success mb-3">
                  Product Details
                </h6>

                <div className="row">
                  <div className="col-md-6">
                    Brand: {selectedPurchase.brand || "-"}
                  </div>
                  <div className="col-md-6">
                    Model: {selectedPurchase.model || "-"}
                  </div>
                  <div className="col-md-6">
                    RAM: {selectedPurchase.ram || "-"}
                  </div>
                  <div className="col-md-6">
                    ROM: {selectedPurchase.rom || "-"}
                  </div>
                  <div className="col-md-6">
                    Color: {selectedPurchase.color || "-"}
                  </div>
                  <div className="col-md-6">
                    Battery: {selectedPurchase.battery_health || "-"}
                  </div>
                  <div className="col-md-6">
                    Condition: {selectedPurchase.condition || "-"}
                  </div>
                </div>
              </Card.Body>
            </Card>

         
            <Form.Group className="mb-3">
              <Form.Label>Return Quantity</Form.Label>
              <Form.Control
                type="number"
                min={1}
                max={selectedPurchase.available_stock}
                value={returnQuantity}
                onChange={(e) =>
                  setReturnQuantity(parseInt(e.target.value) || 0)
                }
              />
            </Form.Group>

   
            <Form.Group className="mb-3">
              <Form.Label>Note</Form.Label>
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