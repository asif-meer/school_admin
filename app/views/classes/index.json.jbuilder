json.array!(@school_classes) do |school_class|
  json.extract! school_class, :id, :, :short_name, :color, :employee_id
  json.url school_class_url(school_class, format: :json)
end
