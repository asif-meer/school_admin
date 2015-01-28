class ChangeDateOfBirthTypeOfEmployees < ActiveRecord::Migration
  def change
  	 change_column :employees, :date_of_birth, :date
  end
end
