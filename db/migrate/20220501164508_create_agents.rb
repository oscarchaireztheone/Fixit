class CreateAgents < ActiveRecord::Migration[6.0]
  def change
    create_table :agents do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.boolean :working
      t.string :employeeNum
      t.string :other

      t.timestamps
    end
  end
end
