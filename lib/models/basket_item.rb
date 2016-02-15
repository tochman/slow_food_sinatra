class BasketItem
  include DataMapper::Resource

  property :id, Serial, key: true, required: false
  property :qty, Integer
  property :dish, Object
  belongs_to :basket

end
