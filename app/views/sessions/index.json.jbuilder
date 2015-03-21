json.array!(@sessions) do |session|
  json.extract! session, :id, :name, :from_date, :to_date
  json.url session_url(session, format: :json)
end
