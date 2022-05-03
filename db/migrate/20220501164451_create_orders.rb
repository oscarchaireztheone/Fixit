class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :model
      t.string :serial
      t.string :brand
      t.string :callsid
      t.text :symptom
      t.integer :status
      t.references :agent, null: false, foreign_key: true
      t.string :address
      t.string :window
      t.references :technician, null: false, foreign_key: true
      t.string :day
      t.string :invoiceNumber
      t.string :invoicetype
      t.string :laborCharge
      t.string :part
      t.decimal :amtDue
      t.decimal :taxAmt
      t.string :other

      t.timestamps
    end
  end
end
