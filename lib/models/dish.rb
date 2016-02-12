class Dish
  include DataMapper::Resource

  property :id, Serial, key: true
  property :name, String, length: 128, unique: true, required: true
  property :price, Integer, required: true
  #property :category, String

  belongs_to :user, required: false
  belongs_to :category
  belongs_to :basket, required: false

end
