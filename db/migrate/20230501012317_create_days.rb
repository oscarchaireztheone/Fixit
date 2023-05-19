class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.date :date
      t.integer :tech_id
      t.string :status
      t.integer :slot1
      t.integer :slot2
      t.integer :slot3
      t.integer :slot4
      t.integer :slot5
      t.integer :slot6
      t.integer :slot7
      t.integer :slot8

      t.timestamps
    end
  end
end
