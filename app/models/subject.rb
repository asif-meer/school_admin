# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  batch_id   :integer
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  short_name :string(255)
#  color      :string(255)
#

class Subject < ActiveRecord::Base
  # associations
  # belongs_to :course
  # belongs_to :batch
  has_many :classroom_subjects, dependent: :destroy
  has_many :classrooms, :through => :classroom_subjects

  has_many :lessons, dependent: :destroy, foreign_key: :subject_id
  
  has_many :period, through: :lessons
  has_many :teachers, through: :lessons

  # validations
  validates_presence_of :title, :short_name

  def to_s
    title
  end

  def save_with_classrooms(params)
    self.classroom_subjects.build(:classroom_id => params)
    save
  end

  def self.find_or_create(attributes)
    Subject.where(attributes).first || Subject.create(attributes)
  end

  
end
