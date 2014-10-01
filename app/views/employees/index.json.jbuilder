json.array!(@employees) do |employee|
  json.extract! employee, :id, :first_name, :last_name, :date_of_birth, :gender, :employee_number, :joining_date, :department_id, :employee_position_id, :job_title, :qualification, :total_experience, :present_address, :perminent_address, :phone, :email
  json.url employee_url(employee, format: :json)
end
