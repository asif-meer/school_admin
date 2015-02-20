# == Schema Information
#
# Table name: experiences
#
#  id              :integer          not null, primary key
#  company         :string(255)
#  position        :string(255)
#  from_date       :date
#  to_date         :date
#  teacher_id      :integer
#  still_attending :boolean
#  created_at      :datetime
#  updated_at      :datetime
#

class Experience < ActiveRecord::Base
	belongs_to :teacher, :class_name => "Employee", :foreign_key => :teacher_id
end
