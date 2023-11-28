class Article < ApplicationRecord
  validates :title, :content, :description, :url, presence: true

  # scopes
  scope :order_by_published, -> { order('published_at') }
  scope :order_by_title, -> { order('title') }
end
