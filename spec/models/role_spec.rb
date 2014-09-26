# require 'rails_helper'

# RSpec.describe Role, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

require 'spec_helper'

describe Role do
  it { should validate_presence_of(:name) }
end