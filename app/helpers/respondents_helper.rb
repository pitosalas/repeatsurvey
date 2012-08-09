module RespondentsHelper
  def line_sparkline_markup(title, data)
    content_tag(:span, data.join(","),:class => "inlinesparkline") + 
    content_tag(:br) + 
    content_tag(:span, title)
  end
end
