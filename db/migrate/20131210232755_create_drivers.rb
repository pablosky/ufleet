class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :cargo
      t.string :ci
      t.string :nombre
      t.string :apellidopaterno
      t.string :apellidomaterno
      t.integer :celular
      t.string :estadochofer

      t.timestamps
    end
  end
end
