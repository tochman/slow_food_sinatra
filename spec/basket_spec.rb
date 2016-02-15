require './lib/models/basket'

describe Basket do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :created_at }
  it { is_expected.to have_property :created_on }
  it { is_expected.to have_property :updated_at }
  it { is_expected.to have_property :updated_on }


  it { is_expected.to have_many :dishes }
  #it { is_expected.to belong_to :user }
end
