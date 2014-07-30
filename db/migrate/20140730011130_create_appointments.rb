class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :time
      t.string :language
    end
  end
end
