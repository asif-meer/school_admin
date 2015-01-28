# == Schema Information
#
# Table name: fees_periods
#
#  id                 :integer          not null, primary key
#  fees_category_id   :integer
#  batch_id           :integer
#  start_date         :date
#  end_date           :date
#  due_date           :date
#  created_at         :datetime
#  updated_at         :datetime
#  fees_particular_id :integer
#

require 'rails_helper'

RSpec.describe FeesPeriod, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
