class AddColorToSubjects < ActiveRecord::Migration
  def change
  	add_column :subjects, :color, :string
  end
end
