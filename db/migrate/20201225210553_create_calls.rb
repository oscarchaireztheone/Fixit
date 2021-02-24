class CreateCalls < ActiveRecord::Migration[6.0]
  def change
    create_table :calls do |t|
      t.string :name
      t.string :pnum
      t.string :address
      t.string :model
      t.string :serial
      t.string :callsid
      t.string :appdate
      t.string :symptom
      t.string :picture
      t.string :payid
      t.string :status

      t.timestamps
    end
  end
end
