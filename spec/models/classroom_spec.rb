# == Schema Information
#
# Table name: classrooms
#
#  id             :integer          not null, primary key
#  classroom_name :string(255)
#  short_name     :string(255)
#  shared         :boolean
#  color          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'rails_helper'

RSpec.describe Classroom, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
