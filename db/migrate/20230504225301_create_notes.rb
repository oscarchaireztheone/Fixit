class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.text :note_content
      t.string :phone_number, null: false
      t.integer :call_id
      t.string :status

      t.timestamps
    end
  end
end
