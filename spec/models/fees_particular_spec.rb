# == Schema Information
#
# Table name: fees_particulars
#
#  id               :integer          not null, primary key
#  fees_category_id :integer
#  name             :string(255)
#  description      :text
#  all              :boolean          default(FALSE)
#  roll_no          :string(255)
#  batch_id         :integer
#  amount           :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

require 'rails_helper'

RSpec.describe FeesParticular, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
