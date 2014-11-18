class CreateFeesParticulars < ActiveRecord::Migration
  def change
    create_table :fees_particulars do |t|
      t.references :fees_category, index: true
      t.string :name
      t.text :description
      t.boolean :all, default: :false
      t.string :roll_no
      t.references :batch, index: true
      t.string :amount

      t.timestamps
    end
  end
end
