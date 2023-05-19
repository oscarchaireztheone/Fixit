class AddDayRefToSamsungcalls < ActiveRecord::Migration[6.0]
  def change
    add_reference :samsungcalls, :day, null: true, foreign_key: true
  end
end
