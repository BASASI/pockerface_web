json.array!(@cards) do |card|
  json.extract! card, :id, :image_url, :offense, :defense
  json.url card_url(card, format: :json)
end
