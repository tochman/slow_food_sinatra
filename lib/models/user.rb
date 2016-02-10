
class User
  include DataMapper::Resource

  property :id, Serial, key: true
  property :username, String, length: 128, unique: true
  property :admin, Boolean, default: false
  property :address, Text
  property :password, BCryptHash

  validates_presence_of :address, if: lambda { |t| t.admin == false}


  def authenticate(attempted_password)
    self.password == attempted_password
  end

  def initialize(options={})
    self.admin  = options[:admin] || false
    super
  end
end


