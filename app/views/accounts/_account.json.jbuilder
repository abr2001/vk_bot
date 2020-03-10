json.extract! account, :id, :name, :token, :user, :provider, :code, :comment, :created_at, :updated_at
json.url account_url(account, format: :json)
