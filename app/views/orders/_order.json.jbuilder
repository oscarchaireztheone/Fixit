json.extract! order, :id, :customer_id, :model, :serial, :brand, :callsid, :symptom, :status, :agent_id, :other, :address, :window, :technician_id, :day, :other, :invoiceNumber, :invoicetype, :laborCode, :part, :amtDue, :taxAmt, :other, :created_at, :updated_at
json.url order_url(order, format: :json)
