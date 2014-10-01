# == Schema Information
#
# Table name: emergency_contacts
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  phone        :string(255)
#  relationship :string(255)
#  student_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe EmergencyContact, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
