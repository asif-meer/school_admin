# == Schema Information
#
# Table name: lessons
#
#  id              :integer          not null, primary key
#  subject_id      :integer
#  teacher_id      :integer
#  school_class_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#  week_day_id     :integer
#  classroom_id    :integer
#  period_id       :integer
#

class Lesson < ActiveRecord::Base
	belongs_to :subject
	belongs_to :teacher, class_name: "Employee", :foreign_key => :teacher_id
	belongs_to :school_class
	belongs_to :classroom
	belongs_to :week_day
	belongs_to :period
end
