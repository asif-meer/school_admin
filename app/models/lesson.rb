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
	belongs_to :teacher, :class_name => "Employee", :foreign_key => :teacher_id
	belongs_to :school_class
	belongs_to :classroom
	belongs_to :week_day
	belongs_to :period

	validate :check_priority, on: :create
 	# WEEK_DAYS = ["Monday", "Tuesday", "Wednesday", "Thurday", "Friday", "Saturday", "Sunday"]
 
	before_create :check_priority

	def check_priority
    lesson = self.subject.lessons.all
    lesson.each do |l|
    	if l.week_day == self.week_day
		    if self.period == l.period
		    	if self.school_class == l.school_class
	      		errors.add :base, "This Lesson is already assigned for #{l.subject.title} subject on #{l.week_day.name} for class #{l.school_class.class_name}."
      		end
		    end
	    end 
    end
  end

end
