class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :batch_name
      t.date :start_date
      t.date :end_date
      t.integer :course_id
      
      t.timestamps
    end
  end
end
