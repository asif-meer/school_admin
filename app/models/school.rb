class School < ActiveRecord::Base
  # associations
  belongs_to :user

  # validations
  validates_presence_of :user
  validates_presence_of :school_name, :school_address, :school_phone

  def self.find_or_create(attributes)
    School.where(attributes).first || School.create(attributes)
  end
end
