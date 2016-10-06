json.array!(@previa_groups) do |previa_group|
  json.extract! previa_group, :id
  json.url previa_group_url(previa_group, format: :json)
end
