# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  course_name  :string(255)
#  section_name :string(255)
#  code         :string(255)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Course < ActiveRecord::Base
  # associations
  # belongs_to :user
  has_many   :batches
  has_many   :students
  # has_many   :subjects

  # validations
  # validates_presence_of :user
  validates_presence_of :course_name, :code

  def to_s
    course_name
  end

  def self.find_or_create(attributes)
    Course.where(attributes).first || Course.create(attributes)
  end
end
