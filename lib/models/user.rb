
class User
  include DataMapper::Resource
  attr_accessor :password_confirmation

  property :id, Serial, key: true
  property :username, String, length: 128, unique: true
  property :admin, Boolean, default: false
  property :password, BCryptHash
  property :email, Text
  property :phone_number, Text

  validates_presence_of :email, if: ->(t) { t.admin == false }, message: 'Please add email adress'
  validates_presence_of :phone_number, if: ->(t) { t.admin == false }, message: 'Please provide phone number'
  validates_confirmation_of :password, message: 'Password not matching confirmation'

  def authenticate(attempted_password)
    password == attempted_password
  end

  def initialize(options = {})
    self.admin = options[:admin] || false
    super
  end
end
