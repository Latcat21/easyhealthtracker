class CalorieTrackerController < ApplicationController


  get '/' do
    erb :'calories'
  end
 
  get '/search' do
    
    foods = params[:foods]
    headers = {
      "x-app-id" =>  ENV["ID"],
      "x-app-key" => ENV["KEY"],
      "x-remote-user-id" => "0"
    }
    url = "https://trackapi.nutritionix.com/v2/natural/nutrients"

    response = RestClient.post url, "query=#{foods}", headers
    parsed_res = JSON.parse(response) 
    puts parsed_res
    if parsed_res["foods"]
      session[:search] = true
      @foods = parsed_res["foods"]
    else
      session[:search] = 'bad'
    end

    erb :calories
    end

end