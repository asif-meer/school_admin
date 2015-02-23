module ApplicationHelper
  COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  def link_to_function(name, *args, &block)
     html_options = args.extract_options!.symbolize_keys

     function = block_given? ? update_page(&block) : args[0] || ''
     onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
     href = html_options[:href] || '#'

     content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick))
  end

  def days_in_month(month, year = Time.now.year)
     return 29 if month == 2 && Date.gregorian_leap?(year)
     COMMON_YEAR_DAYS_IN_MONTH[month]
  end

  def link_to_add_fields_assocaitions(name, f, association)
	  new_object = f.object.send(association).klass.new
	  id = new_object.object_id
	  fields = f.simple_fields_for(association, new_object, :child_index => id) do |builder|
	    render(association.to_s.singularize + "_fields", :f => builder)
	  end
	  link_to "#", class: "add_fields btn btn-success pull-right", data: {id: id, fields: fields.gsub("\n", "")} do
  			render :text => (name+" <i class='glyphicon glyphicon-plus'></i>").html_safe
	  end
	end
end
