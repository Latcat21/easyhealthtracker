require 'sinatra/base'


#controllers
require './controllers/ApplicationController'


map ('/'){
  run ApplicationController
}