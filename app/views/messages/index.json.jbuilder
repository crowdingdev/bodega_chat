json.array!(@messages) do |message|
  json.extract! message, :id, :content, :user_id, :group_id
  json.url message_url(message, format: :json)
end