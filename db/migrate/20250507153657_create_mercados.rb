class CreateMercados < ActiveRecord::Migration[8.0]
  def change
    create_table :mercados do |t|
      t.string :nombre
      t.string :ubicacion
      t.string :alcaldia

      t.timestamps
    end
  end
end
