json.extract! payment, :id, :order_id, :payee, :meth, :idNum, :amount, :other, :created_at, :updated_at
json.url payment_url(payment, format: :json)
