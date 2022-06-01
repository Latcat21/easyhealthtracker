require 'sinatra/base'


#controllers
require './controllers/ApplicationController'
require './controllers/UserController'

#Models
require './models/UserModel'


map ('/'){
  run ApplicationController
}

map ('/users'){
  run UserController
}