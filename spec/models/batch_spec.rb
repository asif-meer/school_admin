# == Schema Information
#
# Table name: batches
#
#  id         :integer          not null, primary key
#  batch_name :string(255)
#  start_date :date
#  end_date   :date
#  course_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

# require 'rails_helper'

# RSpec.describe Batch, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

require 'spec_helper'

describe Batch do
  it { should belong_to(:course) }
  it { should validate_presence_of(:batch_name) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
end
