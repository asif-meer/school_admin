class AddFieldsToSubjects < ActiveRecord::Migration
  def change
  	rename_column :subjects, :subject_name, :title
  	add_column :subjects, :short_name, :string
  end
end
