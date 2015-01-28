json.array!(@classrooms) do |classroom|
  json.extract! classroom, :id, :classroom_name, :shared, :short_name, :color
  json.url classrooms_url(classroom, format: :json)
end
