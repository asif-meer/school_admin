class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :institute_name
      t.string :degree
      t.date :start_date
      t.date :completion_date
      t.boolean :still_attending
      t.integer :teacher_id
      t.timestamps
    end
  end
end
