module ApplicationHelper
   def debug_me
      if true
         content_tag(:p, debug(params)) +
         content_tag(:p, debug(@round)) +
         content_tag(:p, debug(@prog))
      end
   end

   def f2s num
      if num
         "%0.2f" % num
      else 
         "n/a"
      end
   end
end
