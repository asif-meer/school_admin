class CreateFeesPeriods < ActiveRecord::Migration
  def change
    create_table :fees_periods do |t|
      t.integer :fees_category_id
      t.integer :batch_id
      t.date :start_date
      t.date :end_date
      t.date :due_date

      t.timestamps
    end
  end
end
