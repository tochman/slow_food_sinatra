require './lib/models/basket_detail'

describe Basket do
  it { is_expected.to have_property :id }

  #it { is_expected.to belong_to :basket }
  it { is_expected.to have_many :dishes }
end
