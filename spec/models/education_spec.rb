# == Schema Information
#
# Table name: educations
#
#  id              :integer          not null, primary key
#  institute_name  :string(255)
#  degree          :string(255)
#  start_date      :date
#  completion_date :date
#  still_attending :boolean
#  teacher_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'rails_helper'

RSpec.describe Education, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
