require './lib/visitor'

describe Visitor do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :title }
  it { is_expected.to have_property :description }
end
