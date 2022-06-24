class ApplicationController < Sinatra::Base
  
  require 'bundler'
  Bundler.require()

  require 'dotenv'
  Dotenv.load

  # require 'net/http'
  require 'rest-client'


  # require './config/environments'

  enable :sessions

  # set up our DB connection --
  ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'easy_health_tracker'
  )
  
  use Rack::MethodOverride

  set :Method_Override, true

  set :views, File.expand_path('../../views', __FILE__)
  
  set :public_dir, File.expand_path('../../public', __FILE__)

  get '/' do
    erb :index
  end

  get '/test' do
    some_text = "this is test"
    binding.pry
   "pry has finished -- here's some_text #{some_text}"
  end

  get '*' do
    halt 404
  end

  helpers do

    def success_message(message)
       return {
        success: true,
        status: "good",
        message: message
      }
    end

    def error_message(message)
      return {
        success: false,
        status: "bad",
        message: message
      }
    end

    def neutral_message(message)
      return {
          success: true,
          status: "neutral",
          message: message
        }
    end

    def is_logged_in?
      session[:logged_in]
    end

    def redirect_if_not_logged_in
      if !is_logged_in?
        redirect '/users/login'
      end
    end

  end

end