class CalorieTrackerController < ApplicationController

  # before do
  #   headers "x-app-id" => "dde99c0b"
  #   headers "x-app-key" => "874d4be4b94b31bf5b2198fbd86b09dd"
  #   headers "x-remote-user-id" => '0'
  #   body = {query: 'pizza'}
  # end

  get '/' do
  
    erb :'calories'
  end
 
  get '/search' do
    
    foods = params[:foods]
    headers = {
      "x-app-id" =>  "dde99c0b",
      "x-app-key" => "874d4be4b94b31bf5b2198fbd86b09dd",
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