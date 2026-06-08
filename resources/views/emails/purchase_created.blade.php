<h2>🛒 New Purchase Notification</h2>

<p><strong>Product:</strong> {{ $purchase->product->name ?? '' }}</p>
<p><strong>Brand:</strong> {{ $purchase->brand }}</p>
<p><strong>IMEI:</strong> {{ $purchase->imei }}</p>
<p><strong>Price:</strong> {{ $purchase->price }}</p>
<p><strong>Branch:</strong> {{ $purchase->branch }}</p>
<p>Added By: {{ auth()->user()->name ?? 'System' }}</p>