class FeesCategory < ActiveRecord::Base

  def to_s
    name
  end

  def self.find_or_create(attributes)
    FeesCategory.where(attributes).first || FeesCategory.create(attributes)
  end
end
