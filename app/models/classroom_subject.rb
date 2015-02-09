class ClassroomSubject < ActiveRecord::Base
	belongs_to :classroom
	belongs_to :subject
end
