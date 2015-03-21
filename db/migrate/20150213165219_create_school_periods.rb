class CreateSchoolPeriods < ActiveRecord::Migration
  def change
    create_table :school_periods do |t|
    	t.integer :period_id
    	t.integer :week_day_id
    	t.integer :school_id

    	t.timestamps
    end
  end
end
