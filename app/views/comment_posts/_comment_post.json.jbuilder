json.extract! comment_post, :id, :user_id, :owner_id, :post_id, :created_at, :updated_at
json.url comment_post_url(comment_post, format: :json)
