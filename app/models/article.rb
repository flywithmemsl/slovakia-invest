class Article < ApplicationRecord
  searchkick

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_and_belongs_to_many :posts
  has_and_belongs_to_many :employees
  belongs_to :service
  has_many :prices, dependent: :destroy

  accepts_nested_attributes_for :prices, allow_destroy: true

  translates :title, :content, :meta_title, :meta_description, :og_title, :og_description

  mount_base64_uploader :og_image, OgImageUploader

  default_scope { order(order: :asc) }
end
