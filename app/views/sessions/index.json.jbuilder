json.array!(@sessions) do |session|
<<<<<<< HEAD
  json.extract! session, :id, :name, :from_date, :to_date
=======
  json.extract! session, :id, :name, :start_date, :end_date
>>>>>>> bae63b7b592d41b65ae4748748d344198f45160e
  json.url session_url(session, format: :json)
end
