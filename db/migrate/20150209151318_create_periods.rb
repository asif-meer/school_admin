class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :subject_id
      t.integer :teacher_id
      t.integer :school_class_id
      t.string :week_days

      t.timestamps
    end
  end
end
