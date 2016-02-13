class BasketDetail
  include DataMapper::Resource

  property :id, Serial, key: true
  property :qty, Integer, default: 1

  has n, :dishes, through: Resource
  #belongs_to :basket


end
