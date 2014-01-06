json.array!(@reservations) do |reservation|
  json.extract! reservation, :driver_id, :vehicle_id, :inicio, :fin, :descripcion
  json.url reservation_url(reservation, format: :json)
end
