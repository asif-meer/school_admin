# == Schema Information
#
# Table name: subjects
#
#  id           :integer          not null, primary key
#  course_id    :integer
#  batch_id     :integer
#  title        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  short_name   :string(255)
#  classroom_id :integer
#

# require 'rails_helper'

# RSpec.describe Subject, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

require 'spec_helper'

describe Subject do
  it { should belong_to(:course) }
  it { should belong_to(:batch) }
  it { should validate_presence_of(:subject_name) }
end
