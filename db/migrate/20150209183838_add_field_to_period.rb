class AddFieldToPeriod < ActiveRecord::Migration
  def change
  	add_column :periods, :level, :integer
  	add_column :periods, :week_day_id, :integer
  end

  def down
  	remove_column :periods, :week_day_id
  end
end
