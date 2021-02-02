# custom LinkRenderer for will_paginate helper
class CrownbitLinkRenderer < BootstrapPagination::Rails
  protected

  def page_number(page)
    link_options = @options[:link_options] || {}

    if page == current_page
      tag('li', tag('span', page, style: 'color:white;'), class: 'crown-page-item active')
    else
      tag('li', link(page, page, link_options.merge(rel: rel_value(page))), class: 'crown-page-item')
    end
  end
end
