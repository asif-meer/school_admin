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

require 'rails_helper'

RSpec.describe SchoolEvent, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
