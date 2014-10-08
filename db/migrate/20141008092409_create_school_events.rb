class CreateSchoolEvents < ActiveRecord::Migration
  def change
    create_table :school_events do |t|
      t.string :Event_name
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
