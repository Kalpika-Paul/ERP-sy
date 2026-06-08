// resources/js/components/PrivateLayout.jsx
import React from "react";
import { Outlet } from "react-router-dom";
import Navbar from "./Navbar";

export default function PrivateLayout() {
  return (
    <>
      <Navbar />
      <div className="pt-5 px-4">
        <Outlet />
      </div>
    </>
  );
}