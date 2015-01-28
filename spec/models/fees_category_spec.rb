# == Schema Information
#
# Table name: fees_categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe FeesCategory, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
