class ClassCategory < ActiveRecord::Base
  # @TODO write categories in seed file
  # example Pre junior, Junior , Senior

  def self.all
     [ [1,"Pre junior"],
       [2,"Junior"],
       [3,"Senior"]
     ]
   end
   
end
