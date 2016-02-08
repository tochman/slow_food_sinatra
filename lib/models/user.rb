
class User
  include DataMapper::Resource

  property :id, Serial, key: true
  property :username, String, length: 128, unique: true

  property :password, BCryptHash


  def authenticate(attempted_password)
    self.password == attempted_password
  end
end


