puts "Creating periods"
Period.find_or_create(:name => "1rst", :short => "1rst", :start_time => "2000-01-01 08:30:00.000000", :end_time => "2000-01-01 09:15:00.000000", :duration => "45")
Period.find_or_create(:name => "2nd", :short => "2nd", :start_time => "2000-01-01 09:15:00.000000", :end_time => "2000-01-01 10:00:00.000000", :duration => "45")
Period.find_or_create(:name => "3rd", :short => "3rd", :start_time => "2000-01-01 10:00:00.000000", :end_time => "2000-01-01 10:45:00.000000", :duration => "45")
Period.find_or_create(:name => "4rth", :short => "4rth", :start_time => "2000-01-01 10:45:00.000000", :end_time => "2000-01-01 11:30:00.000000", :duration => "45")
Period.find_or_create(:name => "5th", :short => "5th", :start_time => "2000-01-01 11:30:00.000000", :end_time => "2000-01-01 12:15:00.000000", :duration => "45")
Period.find_or_create(:name => "6th", :short => "6th", :start_time => "2000-01-01 12:15:00.000000", :end_time => "2000-01-01 13:00:00.000000", :duration => "45")
Period.find_or_create(:name => "7th", :short => "7th", :start_time => "2000-01-01 13:00:00.000000", :end_time => "2000-01-01 13:45:00.000000", :duration => "45")
Period.find_or_create(:name => "8th", :short => "8th", :start_time => "2000-01-01 13:45:00.000000", :end_time => "2000-01-01 14:30:00.000000", :duration => "45")