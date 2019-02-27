class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :type
      t.belongs_to :patient, foreign_key: true
      t.belongs_to :physician, foreign_key: true

      t.timestamps
    end
  end
end
