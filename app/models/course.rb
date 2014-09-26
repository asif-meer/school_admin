class Course < ActiveRecord::Base
  # associations
  # belongs_to :user
  has_many   :batches

  # validations
  # validates_presence_of :user
  validates_presence_of :course_name, :code

  def self.find_or_create(attributes)
    Course.where(attributes).first || Course.create(attributes)
  end
end
