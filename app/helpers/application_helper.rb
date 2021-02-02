module ApplicationHelper
  def page_title
    ['CrownBits', @page_title].compact.join(' - ')
  end

  def current_layout
    self.controller.send :_layout, self.lookup_context, []
  end

  def active_class(controller)
    return 'active' if params[:controller] == controller
  end
end
