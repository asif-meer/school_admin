# == Schema Information
#
# Table name: periods
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  short      :string(255)
#  start_time :time
#  end_time   :time
#  duration   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Period, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
