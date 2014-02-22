json.array!(@questions) do |question|
  json.extract! question, :pet_owner_id, :content, :category
  json.url question_url(question, format: :json)
end