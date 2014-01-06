json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :patente, :marca, :modelovehiculo, :aniovehiculo, :color, :nrchasis, :garantia, :descripcion, :estado
  json.url vehicle_url(vehicle, format: :json)
end
