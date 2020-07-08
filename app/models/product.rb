class Product < ApplicationRecord
  validates_presence_of :name, :description, :price, :category
  enum category: [:starters, :main_courses, :desserts, :drinks]
end
