json.array!(@sessions) do |session|
  json.extract! session, :id, :name, :start_date, :end_date
  json.url session_url(session, format: :json)
end
