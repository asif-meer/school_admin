class ModifyPeriodsToLessons < ActiveRecord::Migration
  def change
  	rename_table :periods, :lessons
  end
end
