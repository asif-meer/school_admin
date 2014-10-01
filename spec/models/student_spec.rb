# == Schema Information
#
# Table name: students
#
#  id            :integer          not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  date_of_birth :date
#  nic           :string(255)
#  address       :text
#  gender        :string(1)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'rails_helper'

RSpec.describe Student, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
