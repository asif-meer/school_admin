class Period < ActiveRecord::Base
	belongs_to :subject
	belongs_to :school_class
	belongs_to :teacher, :class_name => "Employee", :foreign_key => :teacher_id
	belongs_to :week_day
	validates_presence_of :teacher_id, :school_class_id, :week_day_id, :level

	validate :check_priority, on: :create
	# WEEK_DAYS = ["Monday", "Tuesday", "Wednesday", "Thurday", "Friday", "Saturday", "Sunday"]

	before_create :check_priority

	def check_priority
    period = self.subject.periods.all
    period.each do |p|
    	if p.week_day == self.week_day
		    if self.level == p.level
		    	if self.school_class == p.school_class
		      		errors.add :base, "This period is already assigned for #{p.subject.title} subject on #{p.week_day.name} for class #{p.school_class.class_name}."
	      		end
		    end
	    end 
    end
  end
end
