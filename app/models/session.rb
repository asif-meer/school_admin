class Session < ActiveRecord::Base

	validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :start_date, :end_date
  
  validate :session_name_validations

	def session_name_validations
    errors.add :base, "Session name cannot be greater than current year" if self.name.to_i > Date.today.year
  end

  validate do |session|
    if session.end_date && session.start_date
      errors.add :base, "End Date can't be less than Start Date" if session.end_date < session.start_date
    end
  end
end
