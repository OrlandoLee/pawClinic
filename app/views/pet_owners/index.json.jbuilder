json.array!(@pet_owners) do |pet_owner|
  json.extract! pet_owner, :username, :email, :pet
  json.url pet_owner_url(pet_owner, format: :json)
end