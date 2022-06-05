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
 
  post '/search' do
    
    foods = params[:foods]
    headers = {
      "x-app-id" =>  "dde99c0b",
      "x-app-key" => "874d4be4b94b31bf5b2198fbd86b09dd",
      "x-remote-user-id" => "0"
    }
    url = "https://trackapi.nutritionix.com/v2/natural/nutrients"

    response = RestClient.post url, "query=#{foods}", headers

    puts response
  

  # uri = URI.parse("https://trackapi.nutritionix.com/v2/natural/nutrients")
  # http = Net::HTTP.new(uri.host, uri.port)
  # response = http.post(uri.path, 'query=pizza', headers)

  # rescue => error
  # puts 'Exception: ' error.message
  # puts response
    #  res =  Net::HTTP.post URI("https://trackapi.nutritionix.com/v2/natural/nutrients"),
    #   "query" => "pizza",
    #   "x-app-id" =>  "dde99c0b",
    #   "x-app-key" => "874d4be4b94b31bf5b2198fbd86b09dd",
    #   "x-remote-user-id" => "0"

    #  res.update

    #  res.to_json

    #  puts res


     
      
      
    
  end

end