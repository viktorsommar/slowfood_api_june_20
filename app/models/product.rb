class Product < ApplicationRecord
  validates_presence_of :name, :description, :price, :category
  enum category: [:starters, :maincourses, :desserts, :drinks]
end
