class CreateTechnicians < ActiveRecord::Migration[6.0]
  def change
    create_table :technicians do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :employeeNum
      t.string :other

      t.timestamps
    end
  end
end
