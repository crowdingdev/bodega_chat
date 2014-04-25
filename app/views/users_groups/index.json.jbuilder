json.array!(@users_groups) do |users_group|
  json.extract! users_group, :id, :user_id, :group_id
  json.url users_group_url(users_group, format: :json)
end
