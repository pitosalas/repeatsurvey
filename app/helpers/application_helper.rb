module ApplicationHelper
   def debug_enable enabled, *list
      result = ""
      list.each { |e| result += debug(e) } if enabled
      result.html_safe
   end

   def f2s num
      if num
         "%0.2f" % num
      else 
         "n/a"
      end
   end

   def standard_table( recs, arg_hash )
      @headers = arg_hash[:headers]
      raise "bad call to standard table" if headers.nil?
      @headers << arg_hash[:commands] if arg_hash[:commands]
      content_tag(:table, class: "table") do
         st_generate_headers(headers)
      end
   end

   def st_generate_headers hdrs
      content_tag(:thead) do
         hdrs.map {|h| content_tag(:th, h)}.reduce(:+)
      end
   end

end

