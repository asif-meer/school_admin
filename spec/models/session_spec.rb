# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Session, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
