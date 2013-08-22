json.array!(@units) do |unit|
  json.extract! unit, :name
  json.url unit_url(unit, format: :json)
end
