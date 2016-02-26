class User
  include DataMapper::Resource
  # Include data mapper to use ORB. To tell DataMapper where to look.
  # DataMapper only issues updates or creates for the properties it knows about. So it plays well with others.

 # use the datastore's 'pid' field for the id property.
  property :id, Serial, key: true
  # we can do also this :
  # use a property called 'uid' as the child key (the foreign key)
  # belongs_to :user, :child_key => [ :uid ]
  # to git to items from the database we can use :
  #1 order_id, item_number = 1, 1
  #2 LineItem.get(order_id, item_number)
  #3 => [#<LineItem @orderid=1 @item_number=1>]
  # auto_migrate! and #auto_upgrade!
  # While #auto_migrate! destructively drops and recreates tables to match your model definitions,
  # auto_upgrade! supports upgrading your datastore
  # In situations where neither #auto_migrate! nor #auto_upgrade! quite cut it,
  # you can still fall back to the classic migrations feature provided by dm-migrations.

  property :username, String, length: 128

  property :password, BCryptHash
  property :admin, Boolean, default: false

  def authenticate(attempted_password)
    if self.password == attempted_password
      true
    else
      false
    end
  end
end
