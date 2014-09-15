class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :school_name
      t.text :school_address
      t.string :school_email
      t.string :school_phone
      t.integer :user_id

      t.timestamps
    end
  end
end
