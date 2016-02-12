env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://postgres@localhost/slowfood_v1_#{env}")
DataMapper::Model.raise_on_save_failure = true
DataMapper.finalize
#DataMapper.auto_upgrade!
DataMapper.auto_migrate!

binding.pry

if ENV['RACK_ENV'] != 'test'
  # Set up the required entries in the db
  ['Starter', 'Main course', 'Dessert'].each do |category|
    Category.first_or_create(name: category)
  end

  User.first_or_create(name: 'Admin', password: 'password', password_confirmation: 'password', admin: true)
end

