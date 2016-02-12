# require 'sinatra'
require 'bundler'
Bundler.require
require 'sinatra/form_helpers'
Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each { |file| require file }
require_relative 'helpers/data_mapper'
require_relative 'helpers/warden'
require 'pry'

class SlowFood < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Contrib
  register Sinatra::Warden
  helpers Sinatra::FormHelpers
  set :session_secret, 'supersecret'

  # binding.pry
  # Create a test User
  # if User.count == 0
  #  @user = User.create(username: "admin")
  #  @user.password = "admin"
  #  @user.save
  # end

  use Warden::Manager do |config|
    # Tell Warden how to save our User info into a session.
    # Sessions can only take strings, not Ruby code, we'll store
    # the User's `id`
    config.serialize_into_session(&:id)
    # Now tell Warden how to take what we've stored in the session
    # and get a User from that information.
    config.serialize_from_session { |id| User.get(id) }

    config.scope_defaults :default,
                          # "strategies" is an array of named methods with which to
                          # attempt authentication. We have to define this later.
                          strategies: [:password],
                          # The action is a route to send the user to when
                          # warden.authenticate! returns a false answer. We'll show
                          # this route below.
                          action: 'auth/unauthenticated'
    # When a user tries to log in and cannot, this specifies the
    # app to send the user to.
    config.failure_app = self
  end

  Warden::Manager.before_failure do |env, _opts|
    env['REQUEST_METHOD'] = 'POST'
  end

  # binding.pry
  get '/' do
    erb :index
  end

  namespace '/auth' do
    get '/login' do
      erb :login
    end

    post '/login' do
      env['warden'].authenticate!
      flash[:success] = "Successfully logged in #{current_user.username}"
      if session[:return_to].nil?
        redirect '/'
      else
        redirect session[:return_to]
      end
    end

    get '/admin/register' do
      erb :admin_register
    end

    get '/register' do
      erb :register
    end

    post '/admin/register' do
      user = User.new(
        username: params[:user][:username],
        password: params[:user][:password],
        password_confirmation: params[:user][:password_confirmation],
        admin: true
      )
      begin user.save
        env['warden'].authenticate!
        flash[:success] = "Successfully created account for #{current_user.username}"
        redirect '/'
      rescue
        flash[:error] = user.errors.full_messages.join(',')
      end
    end

    post '/register' do
      user = User.new(
        username: params[:user][:username],
        password: params[:user][:password],
        password_confirmation: params[:user][:password_confirmation],
        email: params[:user][:email],
        phone_number: params[:user][:phone_number]
      )
      begin user.save
        env['warden'].authenticate!
        flash[:success] = "Successfully created account for #{current_user.username}"
        redirect '/'
      rescue
        flash[:error] = user.errors.full_messages.join(',')
      end
      redirect '/auth/register'
    end

    get '/logout' do
      env['warden'].raw_session.inspect
      env['warden'].logout
      flash[:success] = 'Successfully logged out'
      redirect '/'
    end

    post '/unauthenticated' do
      session[:return_to] = env['warden.options'][:attempted_path] if session[:return_to].nil?

      # Set the error and use a fallback if the message is not defined
      flash[:error] = env['warden.options'][:message] || 'You must log in'
      redirect '/auth/login'
    end
  end

  get '/menu' do
    erb :menu
  end

  namespace '/menu' do
    get '/' do
      erb :menu
    end

    get '/add_dish' do
      erb :add_dish
    end

    post '/add_dish' do
      #binding.pry
      category = Category.first(name:params[:category][:name])
      dish = Dish.new(
        name: params[:dish][:name],
        price: params[:dish][:price],
        category: category,
        #category: params[:dish][:category],
        #category: category,
        user: user
      )

      d = dish.user
      if d.admin == true
        dish.save
        flash[:success] = "Successfully added #{dish.name}"
      else
        flash[:error] = 'Sorry!, you are not authorized to add dishes'
       end
         redirect '/'
    end
  end

  get '/protected' do
    env['warden'].authenticate!

    erb :protected
  end
end
