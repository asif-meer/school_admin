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
