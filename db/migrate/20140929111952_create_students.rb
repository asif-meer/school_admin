class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :nic
      t.text :address
      t.string :gender, :limit => 1

      t.timestamps
    end
  end
end
