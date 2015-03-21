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

require 'rails_helper'

RSpec.describe Experience, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
