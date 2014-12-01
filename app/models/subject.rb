# == Schema Information
#
# Table name: subjects
#
#  id           :integer          not null, primary key
#  course_id    :integer
#  batch_id     :integer
#  subject_name :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Subject < ActiveRecord::Base
  # associations
  belongs_to :course
  belongs_to :batch

  # validations
  validates_presence_of :subject_name
  validates_presence_of :course_id, :batch_id

  def to_s
    subject_name
  end

  def self.find_or_create(attributes)
    Subject.where(attributes).first || Subject.create(attributes)
  end
end
