class AddNicToStudents < ActiveRecord::Migration
  def change
    add_column :students, :nic, :string
  end
end
