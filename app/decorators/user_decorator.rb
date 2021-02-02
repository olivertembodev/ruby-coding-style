class UserDecorator < ApplicationDecorator
  include Rails.application.routes.url_helpers
  delegate_all

  def avatar_url
    if object.avatar.attached?
      image_for_avatar
    else
      default_image_url
    end
  rescue ActiveStorage::FileNotFoundError => e
    default_image_url
  end

  def image_for_profile_url
    if object.avatar.attached?
      image_for_profile
    else
      default_image_url
    end
  rescue ActiveStorage::FileNotFoundError => e
    default_image_url
  end

  def updated_at
    object.updated_at.strftime('%B %d, %Y')
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

  private

  def image_for_avatar
    object.avatar.variant(resize_to_limit: [60, 60])
  end

  def image_for_profile
    object.avatar.variant(resize_to_limit: [300, 300])
  end

  def default_image_url
    '/default/user-avatar.png'
  end
end
