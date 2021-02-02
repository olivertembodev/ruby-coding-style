class Blog < ApplicationRecord
  has_one_attached :image
  has_rich_text :description
  belongs_to :author, class_name: 'User', foreign_key: 'user_id', inverse_of: :blogs
  validates :title, uniqueness: true

  def to_s
    title
  end
end
