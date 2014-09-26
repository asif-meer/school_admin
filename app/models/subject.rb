class Subject < ActiveRecord::Base
  # associations
  belongs_to :course
  belongs_to :batch

  # validations
  validates_presence_of :subject_name
  validates_presence_of :course_id, :batch_id
end
