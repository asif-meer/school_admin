class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :name
      t.string :short
      t.time :start_time
      t.time :end_time
      t.integer :duration

      t.timestamps
    end
  end
end
