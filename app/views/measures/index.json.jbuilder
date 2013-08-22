json.array!(@measures) do |measure|
  json.extract! measure, :name
  json.url measure_url(measure, format: :json)
end
