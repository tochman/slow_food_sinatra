class Basket
  include DataMapper::Resource

  property :id, Serial, key: true
  #property :quantity, Integer, default: 1
  has n, :basket_details
  #has n, :dishes, through: :basket_details
  belongs_to :user

end
