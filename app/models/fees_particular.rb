class FeesParticular < ActiveRecord::Base
  belongs_to :fees_category
  belongs_to :batch

  def batch_name?
    if self.batch.present?
      "(#{self.batch.batch_name})- (#{self.batch.course.course_name})"
    elsif self.all.present?
      "All"
    else
      "-"
    end
  end

  def roll_no?
    if self.roll_no.present?
      self.roll_no
    else
      "-"
    end
  end

  def types?
    if self.roll_no.present?
      "Roll No"
    elsif self.all.present?
      "All"
    elsif self.batch.present?
      "Batches"
    end
  end
end
