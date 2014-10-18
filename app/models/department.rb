# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Department < ActiveRecord::Base
  # validations
  validates_presence_of :name

  has_many :employees

  def to_s
    name
  end

  def self.find_or_create(attributes)
    Department.where(attributes).first || Department.create(attributes)
  end
end
