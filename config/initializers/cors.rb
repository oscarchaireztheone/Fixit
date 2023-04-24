Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # Replace this with the origins you want to allow, or use '*' to allow all origins

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options],
      expose: ['Authorization'] # Add any additional headers you want to expose
  end
end