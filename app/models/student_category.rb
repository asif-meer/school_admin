# == Schema Information
#
# Table name: student_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class StudentCategory < ActiveRecord::Base
  # validations
  validates_presence_of :name

  def self.find_or_create(attributes)
    StudentCategory.where(attributes).first || StudentCategory.create(attributes)
  end
end
