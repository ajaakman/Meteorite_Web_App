json.extract! posting, :id, :user_id, :meteorite_id, :weight, :cost, :created_at, :updated_at
json.url posting_url(posting, format: :json)
