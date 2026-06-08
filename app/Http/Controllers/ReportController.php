<?php

namespace App\Http\Controllers;

use App\Models\Purchase;
use Illuminate\Http\Request;

class ReportController extends Controller
{
   

public function supplierReport(Request $request)
{
    $supplierReport = Purchase::select(
        "supplier_name",
        "contact_number",
        "nid_number",
        "memo",
        "month"
    );

   
    if ($request->supplier_name) {
        $supplierReport->where("supplier_name", $request->supplier_name);
    }

    if ($request->month) {
        $supplierReport->whereMonth('month', $request->month);
    }

    if ($request->year) {
        $supplierReport->whereYear('month', $request->year);
    }

    $data = $supplierReport->get();

    return response()->json($data);
}


}
