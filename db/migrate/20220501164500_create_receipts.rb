class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.references :payment, null: false, foreign_key: true
      t.string :recipient
      t.string :deliveryway
      t.string :address
      t.string :summary
      t.string :other

      t.timestamps
    end
  end
end
