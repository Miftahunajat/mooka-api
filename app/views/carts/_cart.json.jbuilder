json.extract! cart, :id, :user_id, :umkm_id, :product_id, :count, :created_at, :updated_at
json.url cart_url(cart, format: :json)
