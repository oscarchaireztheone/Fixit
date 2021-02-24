class CreateWebCalls < ActiveRecord::Migration[6.0]
  def change
    create_table :web_calls do |t|
      t.string :name
      t.string :zipcode
      t.string :Appliance
      t.boolean :asap
      t.string :timestart
      t.string :timeend
      t.boolean :closed

      t.timestamps
    end
  end
end
