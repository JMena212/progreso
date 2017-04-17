module ApplicationHelper
  def category_icon(category)
    case category
    when 'on_track'
      content_tag(:span, '', class: 'glyphicon glyphicon-ok')
    when 'late'
      content_tag(:span, '', class: 'glyphicon glyphicon-warning-sign')
    when 'ahead_of_schedule'
      content_tag(:span, '', class: 'glyphicon glyphicon-thumbs-up')
    end
  end
end
