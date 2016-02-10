class Dish
  include DataMapper::Resource

  property :id, Serial, key: true
  property :name, String, length: 128, unique: true
  property :price, String
  property :category, String


end
