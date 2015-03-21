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

class FeesPeriod < ActiveRecord::Base
  belongs_to :fees_category
  belongs_to :fees_particular


  validates_presence_of :start_date, :end_date, :due_date
  
  validate do |fees_period|
    if fees_period.end_date && fees_period.start_date && fees_period.due_date
      errors.add :base, "End Date can't be less than Start Date"if fees_period.end_date < fees_period.start_date
      errors.add :base, "Due Date can't be less than End Date"if fees_period.due_date < fees_period.end_date
    end
  end
end
