# == Schema Information
#
# Table name: periods
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  short      :string(255)
#  start_time :time
#  end_time   :time
#  duration   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Period < ActiveRecord::Base
	include ActionView::Helpers::DateHelper
	has_many :lessons
	has_many :subjects, through: :lessons

	has_many :subjects, through: :lessons

	has_many :week_days, through: :lessons

	validates_presence_of :name, :short, :start_time, :end_time
	validate :validate_time
	validates_uniqueness_of :name, :short
	def validate_time
		errors.add :base, "Start Time cannot be greater than End Time" if self.start_time > self.end_time
	end

	def time_diff(start_time, end_time)
		hours = ((end_time - start_time) / 60).round
	end

	def self.find_or_create(attributes)
    Period.where(attributes).first || Period.create(attributes)
  end
end
