import React, { useEffect, useState } from "react";
import { Nav, Navbar as BSNavbar, Container, Button } from "react-bootstrap";
import { NavLink, useNavigate } from "react-router-dom";
import axios from "axios";
import NavDropdown from "react-bootstrap/NavDropdown";

export default function Navbar() {
  const [user, setUser] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    try {
      const storedUser = localStorage.getItem("user");
      if (storedUser && storedUser !== "undefined") {
        setUser(JSON.parse(storedUser));
      }
    } catch (error) {
      console.error("Invalid user in localStorage:", error);
      localStorage.removeItem("user");
    }
  }, []);

  const handleLogout = async () => {
    const token = localStorage.getItem("token");

    try {
      await axios.post(
        `${import.meta.env.VITE_API_URL}/api/logout`,
        {},
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );
    } catch (err) {
      console.log("Logout API error");
    }

    localStorage.removeItem("token");
    localStorage.removeItem("user");

    navigate("/login", { replace: true });
  };


  const navStyle = ({ isActive }) => ({
    padding: "8px 14px",
    borderRadius: "999px",
    fontWeight: "500",
    color: isActive ? "#fff" : "#555",
    background: isActive
      ? "linear-gradient(135deg, #37922b, #59d65d)"
      : "transparent",
    transition: "all 0.3s ease",
    textDecoration: "none",
    margin: "0 4px",
  });

  return (
    <BSNavbar
      expand="lg"
      bg="light"
      variant="light"
      className="sticky-top shadow-sm"
    >
      <Container fluid>
        <BSNavbar.Brand as={NavLink} to="/">
          Company
        </BSNavbar.Brand>

        <BSNavbar.Toggle aria-controls="navbarScroll" />

        <BSNavbar.Collapse id="navbarScroll">
          <Nav className="mx-auto my-2 my-lg-0" navbarScroll>

            <Nav.Link as={NavLink} to="/dashboard" end style={navStyle}>
              Home
            </Nav.Link>

            <Nav.Link as={NavLink} to="/product" style={navStyle}>
              Product
            </Nav.Link>

            <Nav.Link as={NavLink} to="/purchase" style={navStyle}>
              Purchase
            </Nav.Link>

            <Nav.Link as={NavLink} to="/inventory" style={navStyle}>
              Inventory
            </Nav.Link>

            <Nav.Link as={NavLink} to="/sales" style={navStyle}>
              Sale
            </Nav.Link>

            <Nav.Link as={NavLink} to="/stock-manage" style={navStyle}>
              Stock Manage
            </Nav.Link>

            <NavDropdown title="Return" id="return-dropdown">
              <NavDropdown.Item as={NavLink} to="/purchase-return">
                Purchase Return
              </NavDropdown.Item>
              <NavDropdown.Item as={NavLink} to="/sales-return">
                Sales Return
              </NavDropdown.Item>

            </NavDropdown>



            <NavDropdown title="Report" id="sales-dropdown">

              <NavDropdown.Item as={NavLink} to="/sales-table">
                All Sales
              </NavDropdown.Item>

              <NavDropdown.Item as={NavLink} to="/supplier-info">
                All Suppliers
              </NavDropdown.Item>

              {user?.type === "admin" && (
                <NavDropdown.Item as={NavLink} to="/profit-report">
                  Profit Report
                </NavDropdown.Item>
              )}

            </NavDropdown>

          </Nav>

          <div className="d-flex align-items-center gap-2">
            {user?.name && (
              <>
                <div className="text-end">
                  <p className="mb-0 fw-semibold">
                    Welcome, {user.name}
                  </p>
                  <small className="text-muted">{user.branch}</small>,{" "}
                  <small className="text-muted">{user.type}</small>
                </div>

                <Button
                  variant="outline-danger"
                  size="sm"
                  onClick={handleLogout}
                >
                  Logout
                </Button>
              </>
            )}
          </div>
        </BSNavbar.Collapse>
      </Container>
    </BSNavbar>
  );
}

