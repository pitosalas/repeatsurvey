require 'report_presenter.rb'

class ReportTableRenderer
  def initialize(helpers)
    @h = helpers
    @headers = []
  end

  def report_headers &block
    @h.content_tag(:thead) do
      @h.content_tag(:tr) do
        @h.capture(&block)
      end
    end
  end

  def header tag, label, css_style=""
    @headers << OpenStruct.new(tag: tag)
    @h.content_tag(:th, label, style: css_style)
  end

  def header_collection tag, collection, css_style=""
    buffer = "".html_safe
    collection.each do |elt|
      buffer += @h.content_tag(:th, elt.short_name, style: css_style)
      @headers << OpenStruct.new(tag: tag, val: elt)
    end
    buffer
  end

  def report_rows &block
    @h.content_tag(:tbody) do
      @h.capture(&block)
    end
  end

  def rows_collection tag, collection, &block
    collection.reduce("".html_safe) do |con1, row|
      con1 + @h.content_tag(:tr, row.text) do
        @headers.reduce("".html_safe) do |con2, col|
          con2 + self.send(col.tag, row, col)
        end
      end
    end
  end

  def rounds row, col
    coords = {question: row.id, respondent: :all, round: col.val.id}
    @h.content_tag(:td, ReportPresenter.new(coords).round_summary_string)
  end

  def questions row, col
    @h.content_tag(:td, row.text)
  end

  def chart row, col
    @h.content_tag(:td, "c")
  end
end