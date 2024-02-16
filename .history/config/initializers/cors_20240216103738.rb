
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://sf-ecommerce-sepia.vercel.app'
    resource '*', headers: :any, methods: [:get, :post, :patch, :delete]
  end
end