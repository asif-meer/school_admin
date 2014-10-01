json.array!(@employee_positions) do |employee_position|
  json.extract! employee_position, :id, :name
  json.url employee_position_url(employee_position, format: :json)
end
