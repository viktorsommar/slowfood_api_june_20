class Product < ApplicationRecord
  has_many :order_items
  validates_presence_of :name, :description, :price, :category
  enum category: [:starters, :main_courses, :desserts, :drinks]
end
