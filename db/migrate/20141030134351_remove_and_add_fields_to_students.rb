class RemoveAndAddFieldsToStudents < ActiveRecord::Migration
  def up
    add_column :students, :nic, :integer
  end

  def down
    remove_column :students, :nic
  end
end
