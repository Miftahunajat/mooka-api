json.extract! user, :id, :nama, :password, :email, :total_donasi, :saldo, :no_telfon, :created_at, :updated_at
json.url user_url(user, format: :json)
