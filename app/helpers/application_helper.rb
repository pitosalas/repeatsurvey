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
end
