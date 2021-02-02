class BlogDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers
  delegate_all

  def image_url_for_head
    if object.image.attached?
      object.image.variant(resize_to_limit: [500, 200])
    else
      default_image_url
    end
  rescue ActiveStorage::FileNotFoundError => e
    default_image_url
  end

  def time_to_read
    object.time_to_read.to_f.to_i.to_s + ' minutes to read'
  end

  def updated_at
    object.updated_at.strftime('%B %d, %Y')
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

  private

  def default_image_url
    '/default/blog-header.png'
  end
end
