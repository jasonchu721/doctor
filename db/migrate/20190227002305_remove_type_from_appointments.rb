class RemoveTypeFromAppointments < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :type, :string
  end
end
