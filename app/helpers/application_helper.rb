module ApplicationHelper
  def render_flashes(*names)
    capture do
      names.each {|f| concat render_flash(f)}
    end
  end

  def render_flash(name)
    message = flash[name]
    return unless message.present?
    content_tag :div, class: name, :'data-alert' => true do
      concat message
      concat content_tag :a, '&times;'.html_safe, href: '#', class: :close
    end
  end
end
