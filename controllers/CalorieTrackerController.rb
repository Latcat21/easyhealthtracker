class CalorieTrackerController < ApplicationController
  get '/' do
    erb :'calories'
  end
end