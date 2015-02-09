class CreateClassroomSubjects < ActiveRecord::Migration
  def change
    create_table :classroom_subjects do |t|
      t.integer :classroom_id
      t.integer :subject_id
      t.timestamps
    end
  end
end
