class Period < ActiveRecord::Base
	serialize :week_days
	belongs_to :subject
	belongs_to :school_class
	belongs_to :teacher, :class_name => "Employee", :foreign_key => :teacher_id
	belongs_to :week_day
	validates_presence_of :teacher_id, :school_class_id, :week_day_id, :level

	# WEEK_DAYS = ["Monday", "Tuesday", "Wednesday", "Thurday", "Friday", "Saturday", "Sunday"]

end
