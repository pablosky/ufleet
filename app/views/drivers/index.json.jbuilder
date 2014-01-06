json.array!(@drivers) do |driver|
  json.extract! driver, :cargo, :ci, :nombre, :apellidopaterno, :apellidomaterno, :celular, :estadochofer
  json.url driver_url(driver, format: :json)
end
