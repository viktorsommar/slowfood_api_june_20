class OrderBelongsToUser < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :orders, :user, foreign_key: true
    
  end
end
