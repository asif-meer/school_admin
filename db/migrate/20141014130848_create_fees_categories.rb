class CreateFeesCategories < ActiveRecord::Migration
  def change
    create_table :fees_categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
