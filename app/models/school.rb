# == Schema Information
#
# Table name: schools
#
#  id             :integer          not null, primary key
#  school_name    :string(255)
#  school_address :text
#  school_email   :string(255)
#  school_phone   :string(255)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class School < ActiveRecord::Base
  # associations
  belongs_to :user

  # validations
  # validates_presence_of :user
  validates_presence_of :school_name, :school_address, :school_phone

  def self.find_or_create(attributes)
    School.where(attributes).first || School.create(attributes)
  end
end
