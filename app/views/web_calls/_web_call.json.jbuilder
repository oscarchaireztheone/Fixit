json.extract! web_call, :id, :name, :zipcode, :Appliance, :asap, :timestart, :timeend, :closed, :created_at, :updated_at
json.url web_call_url(web_call, format: :json)
