class AddAssignableToCrews < ActiveRecord::Migration[6.0]
  def change
    add_reference :crews, :assignable, polymorphic: true, null: false
  end
end
