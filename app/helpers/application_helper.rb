module ApplicationHelper
  def page_name(controller_name, action_name)
    if controller_name != "static_pages"
      " | #{controller_name.titleize}"
    end
  end
end
