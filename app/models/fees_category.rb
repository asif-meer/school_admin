class FeesCategory < ActiveRecord::Base
  has_many :fees_particulars
  
  def to_s
    name
  end

  def self.find_or_create(attributes)
    FeesCategory.where(attributes).first || FeesCategory.create(attributes)
  end
end
