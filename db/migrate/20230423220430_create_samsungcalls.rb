class CreateSamsungcalls < ActiveRecord::Migration[6.0]
  def change
    create_table :samsungcalls do |t|
      t.string :fourk
      t.string :name
      t.string :phone1
      t.string :phone2
      t.string :email
      t.string :address
      t.string :zipcode
      t.boolean :hass
      t.integer :status
      t.string :note
      t.integer :flag

      t.timestamps
    end
  end
end
