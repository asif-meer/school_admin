class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :section_name
      t.string :code
      t.integer :user_id

      t.timestamps
    end
  end
end
