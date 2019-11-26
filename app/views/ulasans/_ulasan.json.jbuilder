json.extract! ulasan, :id, :rating_count, :user_id, :product_id, :comment, :created_at, :updated_at
json.url ulasan_url(ulasan, format: :json)
