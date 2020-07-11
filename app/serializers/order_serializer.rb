class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total, :products 
  def total
    binding.pry 
  end
end
