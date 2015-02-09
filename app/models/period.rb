class Period < ActiveRecord::Base
	serialize :week_days
	belongs_to :subject
	belongs_to :school_class
	belongs_to :teacher, :class_name => "Employee", :foreign_key => :teacher_id

	validates_presence_of :teacher_id, :school_class_id, :week_days

	WEEK_DAYS = ["Monday", "Tuesday", "Wednesday", "Thurday", "Friday", "Saturday", "Sunday"]

	def self.week_days
    	self.week_days.blank? ? "" : self.week_days.join(", ").sub(",","")
    end

end
