require 'sinatra/base'


#controllers
require './controllers/ApplicationController'
require './controllers/UserController'
require './controllers/CalorieTrackerController'

#Models
require './models/UserModel'


map ('/'){
  run ApplicationController
}

map ('/users'){
  run UserController
}

map ('/calories'){
  run CalorieTrackerController
}