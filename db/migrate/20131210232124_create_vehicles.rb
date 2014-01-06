class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :patente
      t.string :marca
      t.string :modelovehiculo
      t.string :aniovehiculo
      t.string :color
      t.string :nrchasis
      t.string :garantia
      t.text :descripcion
      t.string :estado

      t.timestamps
    end
  end
end
