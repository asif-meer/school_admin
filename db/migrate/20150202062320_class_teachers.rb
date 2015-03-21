class ClassTeachers < ActiveRecord::Migration
  def change
  	create_table :class_teachers do |t|
      t.integer :school_class_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
