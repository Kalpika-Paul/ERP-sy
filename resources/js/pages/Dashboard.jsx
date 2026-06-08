import React, { useEffect, useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";

import {
  LineChart,
  Line,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  Tooltip,
  Legend,
  ResponsiveContainer,
  CartesianGrid,
} from "recharts";

export default function Dashboard() {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);

  const [dashboardData, setDashboardData] = useState({
    todayPurchase: 0,
    monthlyPurchase: 0,
    todaySale: 0,
    monthlySale: 0,
    totalAvailableStock: 0,
    stockValuation: 0,
  });

  const [dailyData, setDailyData] = useState([]);
  const [monthlyData, setMonthlyData] = useState([]);

  useEffect(() => {
    const token = localStorage.getItem("token");

    axios
      .get("/api/dashboard-data", {
        headers: { Authorization: `Bearer ${token}` },
      })
      .then((res) => {
        console.log("API DATA:", res.data); // 🔥 debug

        setDashboardData({
          todayPurchase: res.data.todayPurchase ?? 0,
          monthlyPurchase: res.data.monthlyPurchase ?? 0,
          todaySale: res.data.todaySale ?? 0,
          monthlySale: res.data.monthlySale ?? 0,
          totalAvailableStock: res.data.availableStock ?? 0,
          stockValuation: res.data.stockValuation ?? 0,
        });

      
        setDailyData(Array.isArray(res.data.dailyData) ? res.data.dailyData : []);
        setMonthlyData(Array.isArray(res.data.monthlyData) ? res.data.monthlyData : []);

        if (res.data.user) {
          setUser(res.data.user);
          document.title = `Dashboard – ${res.data.user.name}`;
        }

        setLoading(false);
      })
      .catch((err) => {
        console.error("API ERROR:", err);
        setLoading(false);
      });
  }, []);

  const formatCurrency = (amount) =>
    `৳${Number(amount || 0).toLocaleString(undefined, {
      maximumFractionDigits: 0,
    })}`;

 

  return (
    <div className="container">
     
      <div className="mb-2">
        <h4 className="fw-bold mb-0">Dashboard</h4>
        <small className="text-muted">Here's a quick overview.</small>
      </div>

      <div className="row g-3">
       
        <div className="col-lg-4 col-md-6">
          <Link to="/purchase" className="text-decoration-none">
            <div className="card h-100 border-0 shadow-sm rounded-3 bg-primary bg-gradient text-white">
              <div className="card-body p-3">
                <div className="d-flex align-items-center mb-2">
                  <span className="me-2">📦</span>
                  <small className="fw-bold text-uppercase">Purchase</small>
                </div>
                <div className="d-flex justify-content-between pt-2 border-top border-white border-opacity-10">
                  <div>
                    <p className="small mb-0">Today</p>
                    <p className="fw-bold">
                      {formatCurrency(dashboardData.todayPurchase)}
                    </p>
                  </div>
                  <div>
                    <p className="small mb-0">This Month</p>
                    <p className="fw-bold">
                      {formatCurrency(dashboardData.monthlyPurchase)}
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </Link>
        </div>

        <div className="col-lg-4 col-md-6">
          <Link to="/sales-table" className="text-decoration-none">
            <div className="card h-100 border-0 shadow-sm rounded-3 bg-success bg-gradient text-white">
              <div className="card-body p-3">
                <div className="d-flex align-items-center mb-2">
                  <span className="me-2">💰</span>
                  <small className="fw-bold text-uppercase">Sales</small>
                </div>
                <div className="d-flex justify-content-between pt-2 border-top border-white border-opacity-10">
                  <div>
                    <p className="small mb-0">Today</p>
                    <p className="fw-bold">
                      {formatCurrency(dashboardData.todaySale)}
                    </p>
                  </div>
                  <div>
                    <p className="small mb-0">This Month</p>
                    <p className="fw-bold">
                      {formatCurrency(dashboardData.monthlySale)}
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </Link>
        </div>

       
        <div className="col-lg-4 col-md-6">
          <Link to="/inventory" className="text-decoration-none">
            <div className="card h-100 border-0 shadow-sm rounded-3 bg-info bg-gradient text-white">
              <div className="card-body p-3">
                <div className="d-flex align-items-center mb-2">
                  <span className="me-2">📊</span>
                  <small className="fw-bold text-uppercase">Stock</small>
                </div>
                <div className="d-flex justify-content-between pt-2 border-top border-white border-opacity-10">
                  <div>
                    <p className="small mb-0">Available</p>
                    <p className="fw-bold">
                      {dashboardData.totalAvailableStock}
                    </p>
                  </div>
                  <div>
                    <p className="small mb-0">Value</p>
                    <p className="fw-bold">
                      {formatCurrency(dashboardData.stockValuation)}
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </Link>
        </div>
      </div>

  
      <div className="row mt-4 g-4">
        
        <div className="col-lg-6">
          <div className="card border-0 shadow-sm rounded-4 p-4">
            <h6 className="fw-bold mb-3">Last 7 Days</h6>

            <ResponsiveContainer width="100%" height={300}>
              <LineChart
                data={
                  dailyData.length
                    ? dailyData
                    : [{ date: "No Data", sales: 0, purchase: 0 }]
                }
              >
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="date" />
                <YAxis />
                <Tooltip />
                <Legend />
                <Line dataKey="sales" stroke="#28a745" />
                <Line dataKey="purchase" stroke="#007bff" />
              </LineChart>
            </ResponsiveContainer>
          </div>
        </div>

       
        <div className="col-lg-6">
          <div className="card border-0 shadow-sm rounded-4 p-4">
            <h6 className="fw-bold mb-3">Monthly</h6>

            <ResponsiveContainer width="100%" height={300}>
              <BarChart
                data={
                  monthlyData.length
                    ? monthlyData
                    : [{ name: "No Data", sales: 0, purchase: 0 }]
                }
              >
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="name" />
                <YAxis />
                <Tooltip />
                <Legend />
                <Bar dataKey="sales" fill="#28a745" />
                <Bar dataKey="purchase" fill="#007bff" />
              </BarChart>
            </ResponsiveContainer>
          </div>
        </div>
      </div>
    </div>
  );
}