class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :subject_id
      t.integer :period_id
      t.integer :teacher_id
      t.integer :school_class_id
      t.integer :classroom_id
      t.integer :week_day_id
      t.timestamps
    end
  end
end
