# == Schema Information
#
# Table name: school_events
#
#  id          :integer          not null, primary key
#  Event_name  :string(255)
#  description :text
#  start_date  :date
#  end_date    :date
#  created_at  :datetime
#  updated_at  :datetime
#

class SchoolEvent < ActiveRecord::Base
end
