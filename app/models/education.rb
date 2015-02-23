# == Schema Information
#
# Table name: educations
#
#  id              :integer          not null, primary key
#  institute_name  :string(255)
#  degree          :string(255)
#  start_date      :date
#  completion_date :date
#  still_attending :boolean
#  teacher_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Education < ActiveRecord::Base
	belongs_to :teacher, :class_name => "Employee", :foreign_key => :teacher_id

	# validates_presence_of :institute_name, :degree, :start_date, :still_attending
end
