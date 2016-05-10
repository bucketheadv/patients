class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name, null: false, default: ""
      t.string :middle_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.date :birthday, null: false, default: Date.parse("1970-01-01")
      t.integer :gender_id, null: false, default: 0
      t.integer :status_id, null: false, default: 0
      t.integer :location_id, null: false, default: 0
      t.integer :viewed_count, null: false, default: 0
      t.boolean :deleted, null: false, default: false

      t.timestamps null: false
    end
  end
end
