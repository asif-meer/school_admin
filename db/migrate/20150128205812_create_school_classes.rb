class CreateSchoolClasses < ActiveRecord::Migration
  def change
    create_table :school_classes do |t|
      t.string :class_name
      t.string :short_name
      t.string :color

      t.timestamps
    end
  end
end
