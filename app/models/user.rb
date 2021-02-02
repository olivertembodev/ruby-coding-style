class User < ApplicationRecord
  rolify
  has_one_attached :avatar
  validates :name, :password, presence: true, on: :create
  validates :email, uniqueness: true
  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blogs, inverse_of: :author
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
end
