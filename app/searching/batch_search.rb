class BatchSearch
	def self.search_batches(params)
		batch = ""
		if params[:search_by_course] == ""
	      batch = Batch.all
      	elsif params[:search] == ""
      		batch = Batch.where("course_id = ?", "#{params[:search_by_course]}")
	    elsif params[:search_by_course] && params[:search]
	      batch = Batch.where("id = ? AND course_id = ?", "#{params[:search]}", "#{params[:search_by_course]}")
	    elsif params[:search_by_course] || params[:search]
	      batch = Batch.where("id = ? OR course_id = ?", "#{params[:search]}", "#{params[:search_by_course]}")
	    else
	      batch = Batch.all
	    end
	end
end

# def self.search_batches(search, search_by_course)
# 	if search_by_course == ""
#       all
#       where("batch_name LIKE ?", "%#{search}%")
#     elsif search_by_course && params:search
#       where("batch_name LIKE ? AND course_id = ?", "%#{search}%", "#{search_by_course}")
#     elsif search_by_course || :search
#       where("batch_name LIKE ? OR course_id = ?", "%#{search}%", "#{search_by_course}")
#     else
#       all
#     end
# end
# if params[:search_by_course]
# 	batch = Batch.where("course_id = ?", "#{params[:search_by_course]}")
# else
# 	batch = Batch.all
# end