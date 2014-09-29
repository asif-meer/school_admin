class CreateEmergencyContacts < ActiveRecord::Migration
  def change
    create_table :emergency_contacts do |t|
      t.string :name
      t.string :phone
      t.string :relationship
      t.integer :student_id

      t.timestamps
    end

  end
end
