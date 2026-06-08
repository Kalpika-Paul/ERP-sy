import React from "react";
import { Routes, Route, Navigate } from "react-router-dom";
import PrivateRoute from "./components/PrivateRoute";
import PrivateLayout from "./components/PrivateLayout";
import Login from "./pages/Login";
import Dashboard from "./pages/Dashboard";
import ProductTable from "./pages/Product/Product_table";
import AddProduct from "./pages/Product/Add";
import EditProduct from "./pages/Product/Edit";
import Purchase from "./pages/Purchase/Purchase_table";
import PurchaseAdd from "./pages/Purchase/Add";
import PurchaseEdit from "./pages/Purchase/Edit";
import Sales from "./pages/Sales/Sales";
import SalesTable from "./pages/Sales/Sales_table";
import InvoicePage from "./components/Invoice";
import Inventory from "./pages/Inventory";
import StockManage from "./pages/Stock/StockExchange"; 
import SupplierInfo from "./pages/Supplierinfo";
import PurchaseReturn from "./pages/Purchase/Return_purchase_table";
import PurchaseReturnForm from "./pages/Purchase/Return_purchase";
import SaleReturn from "./pages/Sales/Sales_return_table";
import SaleReturnForm from "./pages/Sales/Sales_return";
import ProfitReport from "./pages/Profit_report";


export default function AppRoutes() {
  return (
    <Routes>
      <Route path="/login" element={<Login />} />
      <Route
        element={
          <PrivateRoute>
            <PrivateLayout />
          </PrivateRoute>
        }
      >
        <Route path="/" element={<Navigate to="/dashboard" replace />} />
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/product" element={<ProductTable />} />
        <Route path="/product/add" element={<AddProduct />} />
        <Route path="/product/edit/:id" element={<EditProduct />} />
        <Route path="/purchase" element={<Purchase />} />
        <Route path="/purchase/add" element={<PurchaseAdd />} />
        <Route path="/purchase/edit/:id" element={<PurchaseEdit />} />
        <Route path="/sales" element={<Sales />} />
        <Route path="/sales-table" element={<SalesTable />} />
        <Route path="/invoice/:id" element={<InvoicePage />} />
        <Route path="/inventory" element={<Inventory />} />
        <Route path="/stock-manage" element={<StockManage />} />
        <Route path="/supplier-info" element={<SupplierInfo />} />
        <Route path="/purchase-return" element={<PurchaseReturn />} />
        <Route path="/purchase-return-form" element={<PurchaseReturnForm />} />
        <Route path="/sales-return" element={<SaleReturn />} />
        <Route path="/sale-return-form" element={<SaleReturnForm />} />
         <Route path="/profit-report" element={<ProfitReport/>} />
      </Route>
      <Route path="*" element={<div>404 Not Found</div>} />
    </Routes>
  );
}


