require './lib/models/restaurant'


describe Restaurant do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :name }
  it { is_expected.to have_property :pitch }


end