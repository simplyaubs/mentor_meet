class AddMentorIdAndMenteeIdToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :mentor_id, :integer
    add_column :appointments, :mentee_id, :integer
  end
end
