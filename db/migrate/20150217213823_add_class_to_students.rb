class AddClassToStudents < ActiveRecord::Migration
  def change
  	add_column :students, :school_class_id, :integer
  	add_column :students, :session_id, :integer
  end
end
