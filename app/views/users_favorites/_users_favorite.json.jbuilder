json.extract! users_favorite, :id, :user_id, :product_id, :created_at, :updated_at
json.url users_favorite_url(users_favorite, format: :json)
