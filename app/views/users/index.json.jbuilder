json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :pass, :birth_date, :gender, :city
  json.url user_url(user, format: :json)
end
