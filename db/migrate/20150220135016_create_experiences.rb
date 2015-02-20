class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :company
      t.string :position
      t.date :from_date
      t.date :to_date
      t.integer :teacher_id
      t.boolean :still_attending
      t.timestamps
    end
  end
end
