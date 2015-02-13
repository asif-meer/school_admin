# == Schema Information
#
# Table name: week_days
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class WeekDay < ActiveRecord::Base
	has_many :lessons
	has_many :periods, through: :lessons
end
