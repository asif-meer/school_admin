# == Schema Information
#
# Table name: batches
#
#  id         :integer          not null, primary key
#  batch_name :string(255)
#  start_date :date
#  end_date   :date
#  course_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Batch < ActiveRecord::Base
  # associations
  belongs_to :course
  # has_many   :students
  has_many   :fees_particulars
  has_many   :subjects

  # validations
  validates_presence_of :batch_name
  validates_uniqueness_of :batch_name
  validates_presence_of :start_date, :end_date
  validates_presence_of :course_id
  
  validate :batch_name_validates

  def to_s
    batch_name
  end

  def self.find_or_create(attributes)
    Batch.where(attributes).first || Batch.create(attributes)
  end

  def batch_name_validates
    errors.add :base, "Batch name cannot be less than current year" if self.batch_name.to_i > Date.today.year
  end

  validate do |batch|
    if batch.end_date && batch.start_date
      errors.add :base, "End Date can't be less than Start Date" if batch.end_date < batch.start_date
    end
  end

end
