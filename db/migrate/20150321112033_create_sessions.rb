class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :name
      t.date :from_date
      t.string :to_date

      t.timestamps
    end
  end
end
