class Batch < ActiveRecord::Base
  # associations
  belongs_to :course

  # validations
  validates_presence_of :batch_name
  validates_presence_of :start_date, :end_date
  validates_presence_of :course_id
  
end
