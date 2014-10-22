class AddFiledsToStdents < ActiveRecord::Migration
  def change
    add_column :students, :general_register_number, :integer
    add_column :students, :joining_date, :date
    add_column :students, :course_id, :integer
    add_column :students, :batch_id, :integer
  end
end
