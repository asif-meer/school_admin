class CreateSchoolClasses < ActiveRecord::Migration
  def change
    create_table :school_classes do |t|
      t.string :name
      t.integer :class_category_id

      t.timestamps
    end
  end
end
