require './lib/models/user.rb'

describe User do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :username }
  it { is_expected.to have_property :password }
  it { is_expected.to have_property :admin }

  it 'responds to #admin?' do
    user = User.create(username: 'Admin', admin: true)
    expect(user.admin?).to eq true
  end
end