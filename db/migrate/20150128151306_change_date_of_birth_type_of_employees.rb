class ChangeDateOfBirthTypeOfEmployees < ActiveRecord::Migration
  def change
  	if Rails.env.development? || Rails.env.test?
		change_column :employees, :date_of_birth, :date
	else
  		change_column :employees, :date_of_birth, 'date USING CAST(date_of_birth AS date)'
	end
  end
end
