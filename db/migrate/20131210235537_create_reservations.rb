class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :driver, index: true
      t.references :vehicle, index: true
      t.datetime :inicio
      t.datetime :fin
      t.text :descripcion

      t.timestamps
    end
  end
end
