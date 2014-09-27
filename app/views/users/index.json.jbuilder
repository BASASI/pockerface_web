json.array!(@users) do |user|
  json.extract! user, :id, :device_id, :nickname
  json.url user_url(user, format: :json)
end
