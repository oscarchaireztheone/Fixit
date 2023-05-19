class AddWorkingToTechnicians < ActiveRecord::Migration[6.0]
  def change
    add_column :technicians, :working, :boolean
  end
end
