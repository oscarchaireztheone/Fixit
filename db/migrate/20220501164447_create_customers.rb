class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone1
      t.string :phone2
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
