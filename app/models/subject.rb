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
end
