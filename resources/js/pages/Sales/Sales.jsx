import React, { useState, useMemo, useEffect } from "react";
import {
  Form,
  Button,
  Container,
  Row,
  Col,
  Card,
  ListGroup,
  Badge,
  ProgressBar,
} from "react-bootstrap";
import { FaPlus, FaTrash } from "react-icons/fa";
import axios from "axios";

export default function Sales() {
  const [date, setDate] = useState(new Date().toISOString().split("T")[0]);
  const [customerName, setCustomerName] = useState("");
  const [phone, setPhone] = useState("");
  const [address, setAddress] = useState("");
  const [method, setMethod] = useState("Cash");
  const [discount, setDiscount] = useState("");
  const numericDiscount = Number(discount) || 0;
  const [account, setAccount] = useState("");

  const [products, setProducts] = useState([]);
  const [search, setSearch] = useState("");
  const [cart, setCart] = useState([]);
  const [customPrices, setCustomPrices] = useState({});

  const fetchProducts = async () => {
    const token = localStorage.getItem("token");
    if (!token) return;

    try {
      const res = await axios.get(
        `${import.meta.env.VITE_API_URL}/api/sale/available-products`,
        { headers: { Authorization: `Bearer ${token}` } }
      );
      setProducts(res.data);
    } catch (err) {
      console.error(err.response?.data || err.message);
    }
  };

  useEffect(() => {
    fetchProducts();
  }, []);

  const filteredProducts = useMemo(() => {
    const term = search.toLowerCase();
    return products
      .filter((product) => {
        if (product.brand?.toLowerCase().includes(term)) return true;
        if (product.model?.toLowerCase().includes(term)) return true;
        if (product.colors?.some((c) => c.toLowerCase().includes(term))) return true;
        if (
          product.variants?.some(
            (v) =>
              v.variant?.toLowerCase().includes(term) ||
              v.ram?.toString().includes(term) ||
              v.rom?.toString().includes(term) ||
              v.imei?.toLowerCase().includes(term)
          )
        )
          return true;
        return false;
      })
      .sort((a, b) => {
        const brandA = a.brand?.toLowerCase() || "";
        const brandB = b.brand?.toLowerCase() || "";
        if (brandA !== brandB) return brandA.localeCompare(brandB);
        return (a.model?.toLowerCase() || "").localeCompare(b.model?.toLowerCase() || "");
      });
  }, [search, products]);

  const addToCart = (product, variant, qty = 1) => {
    const priceToUse = customPrices[variant.purchase_id] ?? variant.price;

    setCart((prev) => {
      const baseStock = variant.quantity ?? 0;
      const existingIndex = prev.findIndex((i) => i.purchase_id === variant.purchase_id);
      let alreadyInCart = existingIndex >= 0 ? prev[existingIndex].quantity : 0;
      const stockLeft = baseStock - alreadyInCart;
      if (qty < 1 || qty > stockLeft) return prev;

      if (existingIndex >= 0) {
        const updated = [...prev];
        const newQty = updated[existingIndex].quantity + qty;
        if (newQty > baseStock) return prev;

        updated[existingIndex] = {
          ...updated[existingIndex],
          quantity: newQty,
          price: priceToUse,
          subtotal: newQty * priceToUse,
        };
        return updated;
      }

      return [
        ...prev,
        {
          purchase_id: variant.purchase_id,
          product_id: product.id,
          brand: product.brand,
          model: product.model,
          variant: variant.variant,
          ram: variant.ram,
          rom: variant.rom,
          color: variant.color,
          imei: variant.imei,
          battery_health: variant.battery_health,
          quantity: qty,
          price: priceToUse,
          subtotal: priceToUse * qty,
          original_price: variant.price,
        },
      ];
    });
  };

  const removeFromCart = (index) => {
    const updated = [...cart];
    updated.splice(index, 1);
    setCart(updated);
  };

  const total = cart.reduce((sum, item) => sum + item.subtotal, 0);
  const finalTotal = total - numericDiscount;

  const handleSubmit = async (e) => {
    e.preventDefault();
    const token = localStorage.getItem("token");
    if (!token) return;

    if (cart.length === 0) return alert("Cart is empty!");
    if (!customerName || !phone) return alert("Customer name and phone are required!");

    try {
      const res = await axios.post(
        `${import.meta.env.VITE_API_URL}/api/sale/sales`,
        {
          customerName,
          phone,
          address,
          cart,
          total: finalTotal,
          method,
          discount: numericDiscount,
          account,
          date,
        },
        { headers: { Authorization: `Bearer ${token}` } }
      );

      const saleId = res.data.sale_id;
      window.open(`/invoice/${saleId}`, "_blank");

      setCart([]);
      setCustomerName("");
      setPhone("");
      setAddress("");
      setDiscount("");
      setAccount("");
      setCustomPrices({});
      setDate(new Date().toISOString().split("T")[0]);
      fetchProducts();
    } catch (err) {
      console.error(err.response?.data || err.message);
      alert("Sale failed.");
    }
  };

  return (
    <Container fluid className="px-2 px-md-4 py-3">
      <Row className="g-4">
     
        <Col xs={12} lg={5} className="order-2 order-lg-1">
          <h5 className="mb-3">Products</h5>
          <Form.Control
            type="text"
            placeholder="Search product..."
            className="mb-3"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
          />
     
          <div style={{ maxHeight: "60vh", overflowY: "auto", overflowX: "hidden" }} className="pe-1">
            {filteredProducts.map((product) => (
              <Card key={product.id} className="mb-3 shadow-sm">
                <Card.Body className="p-3">
                  <h6 className="mb-1">{product.model}</h6>
                  <p className="text-muted small mb-2">{product.brand}</p>
                  {product.variants?.map((v, i) => {
                    const inCart = cart.find((c) => c.purchase_id === v.purchase_id)?.quantity || 0;
                    const stockLeft = (v.quantity ?? 0) - inCart;
                    const stockVariant =
                      stockLeft > 5 ? "success" : stockLeft > 0 ? "warning" : "danger";

                    return (
                      <div
                        key={i}
                        className="d-flex align-items-center justify-content-between mb-2 p-2 border rounded"
                      >
                        <div style={{ flex: 1, minWidth: 0 }}>
                          <div className="small text-truncate">
                            {v.variant} • {v.ram}/{v.rom} • {v.color}
                          </div>
                          <div className="fw-bold text-primary">
                            ৳ {customPrices[v.purchase_id] ?? v.price}
                          </div>
                          <div className="text-muted" style={{ fontSize: '0.75rem' }}>
                            IMEI: {v.imei}
                          </div>
                          <div className="mt-1 d-flex align-items-center">
                            <Badge bg={stockVariant} className="me-2" style={{ fontSize: '0.7rem' }}>
                              {stockLeft} Stock
                            </Badge>
                            {v.quantity && (
                              <ProgressBar
                                now={Math.min((stockLeft / (v.quantity || 1)) * 100, 100)}
                                variant={stockVariant}
                                style={{ height: "4px", flex: 1 }}
                              />
                            )}
                          </div>
                          <Form.Control
                            type="number"
                            size="sm"
                            placeholder="Price"
                            value={customPrices[v.purchase_id] ?? v.price}
                            onChange={(e) => {
                              const newPrice = Number(e.target.value);
                              setCustomPrices((prev) => ({
                                ...prev,
                                [v.purchase_id]: newPrice,
                              }));
                              setCart((prevCart) =>
                                prevCart.map((item) =>
                                  item.purchase_id === v.purchase_id
                                    ? { ...item, price: newPrice, subtotal: newPrice * item.quantity }
                                    : item
                                )
                              );
                            }}
                            className="mt-2"
                            style={{ fontSize: '0.8rem' }}
                          />
                        </div>
                        <Button
                          size="sm"
                          variant="success"
                          className="ms-2"
                          disabled={stockLeft < 1}
                          onClick={() => addToCart(product, v, 1)}
                        >
                          <FaPlus size={12} />
                        </Button>
                      </div>
                    );
                  })}
                </Card.Body>
              </Card>
            ))}
          </div>
        </Col>

        <Col xs={12} lg={7} className="order-1 order-lg-2">
          <h5 className="mb-3">Invoice</h5>
          <Form onSubmit={handleSubmit} className="bg-white p-2 rounded ">
            <Row className="g-2 mb-3">
              <Col xs={12} md={4}>
                <Form.Label className="small fw-bold">Customer Name <span className="text-danger">*</span></Form.Label>
                <Form.Control
                  placeholder="Name"
                  value={customerName}
                  onChange={(e) => setCustomerName(e.target.value)}
                  required
                />
              </Col>

              <Col xs={6} md={4}>
                <Form.Label className="small fw-bold">Phone <span className="text-danger">*</span></Form.Label>
                <Form.Control
                  type="number"
                  placeholder="Phone"
                  value={phone}
                  onChange={(e) => setPhone(e.target.value)}
                  required
                />
              </Col>
              
              <Col xs={6} md={4}>
                <Form.Label className="small fw-bold">Date</Form.Label>
                <Form.Control
                  type="date"
                  value={date}
                  onChange={(e) => setDate(e.target.value)}
                />
              </Col>
            </Row>

            <Form.Label className="small fw-bold">Address <span className="text-danger">*</span></Form.Label>
            <Form.Control
              as="textarea"
              rows={2}
              placeholder="Address"
              className="mb-3"
              value={address}
              onChange={(e) => setAddress(e.target.value)}
            />

            <ListGroup className="mb-3">
              {cart.map((item, index) => (
                <ListGroup.Item
                  key={index}
                  className="px-2 py-2"
                >
                  <div className="d-flex justify-content-between align-items-start">
                    <div className="small" style={{ maxWidth: '70%' }}>
                      <div className="fw-bold text-truncate">{item.model}</div>
                      <div className="text-muted" style={{ fontSize: '0.75rem' }}>
                        {item.variant} • {item.ram}/{item.rom} <br/>
                        Qty: {item.quantity} • ৳{item.price}
                      </div>
                    </div>
                    <div className="text-end">
                      <div className="fw-bold small">৳{item.subtotal}</div>
                      <Button size="sm" variant="link" className="text-danger p-0 mt-1" onClick={() => removeFromCart(index)}>
                        <FaTrash size={14} />
                      </Button>
                    </div>
                  </div>
                </ListGroup.Item>
              ))}
            </ListGroup>

            <div className="bg-light p-3 rounded mb-3">
               <div className="d-flex justify-content-between mb-1">
                <span>Total:</span>
                <span className="fw-bold">৳ {total}</span>
              </div>

              <Form.Group className="my-2">
                <Form.Label className="small mb-0">Discount</Form.Label>
                <Form.Control
                  type="number"
                  size="sm"
                  placeholder="Enter discount"
                  value={discount}
                  onChange={(e) => setDiscount(e.target.value)}
                />
              </Form.Group>

              <div className="d-flex justify-content-between mt-2 border-top pt-2">
                <span className="h6 mb-0">Final Total:</span>
                <span className="h6 mb-0 text-success">৳ {finalTotal}</span>
              </div>
            </div>

            <Form.Label className="small fw-bold">Payment Method <span className="text-danger">*</span></Form.Label>
            <Form.Select
              className="mb-3"
              value={method}
              onChange={(e) => {
                setMethod(e.target.value);
                if (e.target.value === "Cash") setAccount("");
              }}
            >
              <option>Cash</option>
              <option>Card</option>
              <option>bKash</option>
              <option>Nagad</option>
              <option>Bank</option>
            </Form.Select>

            {method !== "Cash" && (
              <Form.Control
                className="mb-3"
                placeholder={`${method} Detail / Trans. ID`}
                value={account}
                onChange={(e) => setAccount(e.target.value)}
                required
              />
            )}

            <Button type="submit" className="w-100 btn-success py-2 fw-bold">
              Submit Sale
            </Button>
          </Form>
        </Col>
      </Row>
    </Container>
  );
}

