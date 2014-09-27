class Batch < ActiveRecord::Base
  # associations
  belongs_to :course

  # validations
  validates_presence_of :batch_name
  validates_presence_of :start_date, :end_date
  validates_presence_of :course_id
  
  def to_s
    batch_name
  end
end
