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
