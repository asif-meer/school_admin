class ChangeFieldsOfStudents < ActiveRecord::Migration
  def change
    change_column :students, :nic, :string
  end
end
