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
  
  def markdown(text)
     options = {
       filter_html:     true,
       hard_wrap:       true,
       link_attributes: { rel: 'nofollow', target: "_blank" },
       space_after_headers: true,
       fenced_code_blocks: true
     }
 
     extensions = {
       autolink:           true,
       superscript:        true,
       disable_indented_code_blocks: true
     }
 
     renderer = Redcarpet::Render::HTML.new(options)
     markdown = Redcarpet::Markdown.new(renderer, extensions)
 
     markdown.render(text).html_safe
  end
  
end
