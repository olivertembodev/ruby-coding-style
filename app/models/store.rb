class Store < ApplicationRecord
  require 'will_paginate'
  validates :name, uniqueness: true
  self.per_page = 16
  has_and_belongs_to_many :categories
  has_one_attached :main_image
  scope :approved_stores, -> { where(approve: true) }
  scope :pending_stores, -> { where(approve: false) }
end
