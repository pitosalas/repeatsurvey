class ReportsListRenderer
  def initialize(helpers)
    @h = helpers
  end

  def section_header name
    @h.content_tag(:div, class: "row", id: "section_header") do
      @h.content_tag(:div, class: "span4") do
        @h.content_tag(:h3, name)
      end
    end
  end

  def report &block
    @h.content_tag(:div, class: "row", id: "report") do
      @h.capture(&block)
    end
  end

  def report_title name, &block
      @h.content_tag(:div, class: "offset1 span4") do
        @h.content_tag(:h4, name) + 
        @h.capture(&block)
    end
  end

  def report_blurb &block
    @h.content_tag(:div, class: "row", id: "report_blurb") do
      @h.content_tag(:div, class: "span4") do
        @h.capture(&block)
      end
    end
  end

  def report_thumbnail file_name
    @h.content_tag(:div, class: "span4") do
      @h.image_tag file_name, class: "img-rounded"
    end
  end

end

