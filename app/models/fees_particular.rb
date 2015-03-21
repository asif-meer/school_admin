# == Schema Information
#
# Table name: fees_particulars
#
#  id               :integer          not null, primary key
#  fees_category_id :integer
#  name             :string(255)
#  description      :text
#  all              :boolean          default(FALSE)
#  roll_no          :string(255)
#  batch_id         :integer
#  amount           :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class FeesParticular < ActiveRecord::Base
  belongs_to :fees_category
  has_many :fees_periods
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
