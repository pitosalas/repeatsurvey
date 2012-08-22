module ProgramsHelper
  def reports_list( options = {}, &proc)
    reports_list = ReportsListRenderer.new(self)
    @content = capture(reports_list, &proc)
    content_tag(:div, @content, class: 'container')
  end
end
