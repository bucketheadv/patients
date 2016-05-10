class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :code, null: false, default: ""
      t.string :name, null: false, default: ""

      t.timestamps null: false
    end
  end
end
