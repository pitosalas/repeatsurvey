module ReportsHelper
  def report_table( options = {}, &proc)
    report_table = ReportTableRenderer.new(self)
    @content = capture(report_table, &proc)
    content_tag(:table, @content, class: 'table table-bordered', id: 'report_table')
  end
end
