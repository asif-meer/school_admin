class SchoolclassTeachers < ActiveRecord::Migration
  def change
  	create_table :schoolclass_teachers do |t|
      t.integer :school_class_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
