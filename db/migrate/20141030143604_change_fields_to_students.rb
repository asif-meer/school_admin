class ChangeFieldsToStudents < ActiveRecord::Migration
  def up
    change_column :employees, :gender, :string, :limit => nil
    change_column :students, :gender, :string, :limit => nil
  end

  def down
    remove_column :students, :nic
  end
end
