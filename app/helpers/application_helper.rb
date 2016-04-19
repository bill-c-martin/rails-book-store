module ApplicationHelper
  def hide_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def checkout_button_disabled?
    current_page?(:controller => 'orders', :action => 'new')
  end
end
