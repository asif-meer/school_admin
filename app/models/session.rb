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

class Session < ActiveRecord::Base

	validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :start_date, :end_date
  
  validate :session_name_validations

  has_many :students

	def session_name_validations
    errors.add :base, "Session name cannot be greater than current year" if self.name.to_i > Date.today.year
  end

  validate do |session|
    if session.end_date && session.start_date
      errors.add :base, "End Date can't be less than Start Date" if session.end_date < session.start_date
    end
  end

  def self.find_or_create(attributes)
      Session.where(attributes).first || Session.create(attributes)
  end
end
