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