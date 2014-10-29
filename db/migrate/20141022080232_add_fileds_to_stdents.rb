class AddFiledsToStdents < ActiveRecord::Migration
  def up
    add_column :students, :general_register_number, :integer
    add_column :students, :joining_date, :date
    add_reference :students, :course
    add_reference :students, :batch
  end

  def down
    remove_column :students, :course_id
    remove_column :students, :batch_id
  end
end
