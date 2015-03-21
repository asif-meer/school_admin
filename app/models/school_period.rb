# == Schema Information
#
# Table name: school_periods
#
#  id          :integer          not null, primary key
#  period_id   :integer
#  week_day_id :integer
#  school_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class SchoolPeriod < ActiveRecord::Base
	
end
