prawn_document(:page_layout => :landscape) do |pdf|
  pdf.text "Class #{@class.class_name} Time Table", size: 30, style: :bold
end