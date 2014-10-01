class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.string :gender, :limit => 1
      t.string :employee_number
      t.date :joining_date
      t.references :department, index: true
      t.references :employee_position, index: true
      t.string :job_title
      t.string :qualification
      t.string :total_experience
      t.text :present_address
      t.text :perminent_address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
