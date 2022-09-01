json.extract! reservation, :id, :description, :hour, :day, :week, :month, :year, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
