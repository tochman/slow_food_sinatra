#class Basket
#  include DataMapper::Resource

#  property :id, Serial, key: true, required: false
#  property :qty, Integer, default: 1

  #has n, :dishes, via: adding_to_basket
  # belongs_to :basket

  #def adding_to_basket(dish)

  #end
#end
