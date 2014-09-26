# require 'rails_helper'

# RSpec.describe Course, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

require 'spec_helper'

describe Course do
  it { should belong_to(:user) }
  it { should validate_presence_of(:course_name) }
  it { should validate_presence_of(:code) }
end