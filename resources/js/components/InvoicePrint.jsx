import React from "react";

const InvoicePrint = ({ sale }) => {
  if (!sale) return null;

  const colors = {
    forest: "#0a6740",
    emerald: "#1d9851",
    mint: "#eef7f2",
    accent: "#4caf50",
    textMuted: "#718096"
  };

  const hasDiscount = sale.discount && Number(sale.discount) > 0;

  return (
    <div className="p-5" style={{ color: "#2d3748", fontFamily: "'Inter', sans-serif", lineHeight: "1.6" }}>
      

      <div className="d-flex justify-content-between align-items-center mb-5 pb-4" style={{ borderBottom: `2px solid ${colors.mint}` }}>
        <div className="d-flex align-items-center">
          {/* <div style={{ 
            backgroundColor: colors.forest, 
            padding: "12px", 
            borderRadius: "12px", 
            marginRight: "20px",
            boxShadow: `0 4px 12px rgba(45, 74, 62, 0.2)`
          }}>
            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="white" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
              <rect x="5" y="2" width="14" height="20" rx="2" ry="2"></rect>
              <line x1="12" y1="18" x2="12.01" y2="18"></line>
            </svg>
          </div> */}
          <div>
            <h2 className="m-0 fw-bold" style={{ color: colors.forest, letterSpacing: "-1px" }}>EASTERN MOBILE</h2>
            {/* <p className="m-0 small text-uppercase fw-bold" style={{ color: colors.accent, letterSpacing: "2px", fontSize: "10px" }}>
              Genuine Mobile Parts & Components
            </p> */}
          </div>
        </div>
        <div className="text-end">
          <h5 className="fw-bold mb-0">INV-{sale.invoice_code}</h5>
          <span className="small text-muted">Date: {sale.date}</span>
        </div>
      </div>

      <div className="row mb-5">
        <div className="col-6">
          <p className="small text-uppercase fw-bold mb-2" style={{ color: colors.textMuted }}>Customer Details</p>
          <h5 className="fw-bold mb-1">{sale.customer_name}</h5>
          <p className="mb-1 text-dark">{sale.customer_phone}</p>
          <p className="text-muted small w-75">{sale.customer_address}</p>
        </div>
        <div className="col-6 text-end">
          <p className="small text-uppercase fw-bold mb-2" style={{ color: colors.textMuted }}>Payment Info</p>
          <div className="mb-2">
            <span className="small text-muted">Method: </span>
            <span className="fw-bold text-dark">{sale.payment_method?.toUpperCase()}</span>
          </div>
          
        
          {sale.account && (
            <div 
              className="p-2 rounded-3 text-start" 
              style={{ backgroundColor: colors.mint, border: `1px solid ${colors.accent}40` }}
            >
              <div className="small text-uppercase fw-bold" style={{ fontSize: "9px", color: colors.emerald }}>Account / bKash</div>
              <div className="fw-bold" style={{ color: colors.forest, letterSpacing: "0.5px" }}>
                {sale.account}
              </div>
            </div>
          )}
        </div>
      </div>

      
      <div className="table-responsive mb-5">
        <table className="table table-borderless">
          <thead>
            <tr style={{ borderBottom: `2px solid ${colors.forest}` }}>
              <th className="py-3 ps-0" style={{ color: colors.forest, width: "45%" }}>Part Description</th>
              <th className="py-3 text-center" style={{ color: colors.forest }}>S/N or IMEI</th>
              <th className="py-3 text-center" style={{ color: colors.forest }}>Qty</th>
              <th className="py-3 text-end pe-0" style={{ color: colors.forest }}>Price</th>
            </tr>
          </thead>
          <tbody>
            {sale.cart.map((item, idx) => (
              <tr key={idx} style={{ borderBottom: `1px solid ${colors.mint}` }}>
                <td className="py-4 ps-0">
                  <div className="fw-bold" style={{ fontSize: "15px" }}>{item.brand} {item.model}</div>
                  <div className="small text-muted">
                    {item.variant} 
                    {item.ram && ` | ${item.ram}`}
                    {item.rom && `/${item.rom}`}
                    {item.color && ` | ${item.color}`}
                  </div>
                </td>
                <td className="py-4 text-center align-middle">
                  <span className="font-monospace small px-2 py-1 rounded bg-light" style={{ fontSize: "11px" }}>
                    {item.imei || "N/A"}
                  </span>
                </td>
                <td className="py-4 text-center align-middle fw-medium">{item.quantity}</td>
                <td className="py-4 text-end pe-0 align-middle fw-bold">৳{item.subtotal}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

   
      <div className="row justify-content-end pt-2">
        <div className="col-md-5">
          <div className="p-4 rounded-4" style={{ backgroundColor: "#fbfdfc", border: `1px solid ${colors.mint}` }}>
            {hasDiscount && (
              <div className="d-flex justify-content-between mb-2">
                <span className="text-muted small">Items Subtotal</span>
                <span className="fw-medium">৳{sale.sub_total}</span>
              </div>
            )}

            {hasDiscount && (
              <div className="d-flex justify-content-between mb-3 pb-3" style={{ borderBottom: "1px dashed #ccd9d2" }}>
                <span className="text-muted small">Discount Applied</span>
                <span className="text-danger fw-bold">-৳{sale.discount}</span>
              </div>
            )}

            <div className="d-flex justify-content-between align-items-center">
              <h5 className="mb-0 fw-bold" style={{ color: colors.forest }}>Grand Total</h5>
              <h3 className="mb-0 fw-bold" style={{ color: colors.forest }}>৳{sale.grand_total}</h3>
            </div>
          </div>
        </div>
      </div>

   
      <div className="mt-5 pt-5 text-center">
        <div style={{ width: "60px", height: "2px", background: colors.accent, margin: "0 auto 20px" }}></div>
        <div className="small text-muted opacity-50" style={{ fontSize: "10px" }}>
          This is a system generated receipt. No signature required.
        </div>
      </div>
    </div>
  );
};

export default InvoicePrint;