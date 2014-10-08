class CreateSubjectAllocations < ActiveRecord::Migration
  def change
    create_table :subject_allocations do |t|
      t.references :department, index: true
      t.references :employee, index: true
      t.references :course, index: true
      t.references :batch, index: true
      t.references :subject, index: true

      t.timestamps
    end
  end
end
