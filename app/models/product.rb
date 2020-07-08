class Product < ApplicationRecord
  validates_presence_of :name, :description, :price
enum category: [:starters, :maincourses, :desserts, :drinks]
end
