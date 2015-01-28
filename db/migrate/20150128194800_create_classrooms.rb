class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :classroom_name
      t.string :short_name
      t.boolean :shared
      t.string :color

      t.timestamps
    end
  end
end
