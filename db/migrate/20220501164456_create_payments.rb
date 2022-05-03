class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.string :payee
      t.string :meth
      t.string :idNum
      t.decimal :amount
      t.string :other

      t.timestamps
    end
  end
end
