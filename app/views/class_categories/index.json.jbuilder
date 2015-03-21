json.array!(@class_categories) do |class_category|
  json.extract! class_category, :id, :name
  json.url class_category_url(class_category, format: :json)
end
