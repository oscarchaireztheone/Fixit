json.extract! receipt, :id, :payment_id, :recipient, :deliveryway, :address, :summary, :other, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
