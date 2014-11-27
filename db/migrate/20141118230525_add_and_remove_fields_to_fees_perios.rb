class AddAndRemoveFieldsToFeesPerios < ActiveRecord::Migration
  def change
    add_reference :fees_periods, :fees_particular
    # add_reference :fees_periods, :fees_category
  end
end
