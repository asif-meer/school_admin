# == Schema Information
#
# Table name: school_classes
#
#  id          :integer          not null, primary key
#  class_name  :string(255)
#  short_name  :string(255)
#  color       :string(255)
#  employee_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe SchoolClass, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
