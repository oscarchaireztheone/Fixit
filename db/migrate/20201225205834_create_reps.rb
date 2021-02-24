class CreateReps < ActiveRecord::Migration[6.0]
  def change
    create_table :reps do |t|
      t.string :name
      t.boolean :working
      t.string :pnum
      t.string :provider

      t.timestamps
    end
  end
end
