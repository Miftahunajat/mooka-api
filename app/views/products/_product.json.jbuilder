json.extract! product, :id, :umkm_id, :gambar, :stock, :title, :harga, :rating, :buy_count, :created_at, :updated_at
json.url product_url(product, format: :json)
