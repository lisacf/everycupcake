json.array!(@mastercakes) do |mastercake|
  json.extract! mastercake, :name, :description, :source
  json.url mastercake_url(mastercake, format: :json)
end
