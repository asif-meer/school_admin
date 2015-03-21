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

class FeesCategory < ActiveRecord::Base
  has_many :fees_particulars, dependent: :destroy
  has_many :fees_periods
  
  def to_s
    name
  end

  def self.find_or_create(attributes)
    FeesCategory.where(attributes).first || FeesCategory.create(attributes)
  end
end
