json.array!(@recipes) do |recipe|
  json.extract! recipe, :name, :description, :source, :user_id, :user_id
  json.url recipe_url(recipe, format: :json)
end
