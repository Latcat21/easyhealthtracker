class UserController < ApplicationController

  # shows login page
  get '/login' do
    erb :login
  end

 
  post '/login' do
    user = User.find_by username: params[:username]
    pw = params[:password]

    if user && user.authenticate(pw)
      session[:logged_in] = true
      session[:username] = user.username
      session[:message] = success_message("Logged in as #{user.username}")
      
      redirect '/calories'
    else
      session[:message] = error_message("Invalid username or password.")
      
       redirect '/users/login'
    end

  end

  get '/register' do
    erb :register
  end

 
  post '/register' do
    user = User.find_by username: params[:username]

    if !user
      user = User.new
      user.username = params[:username]
      user.password = params[:password]

    if user.password.length < 8
      session[:logged_in] = false
      session[:message] = error_message("please enter a password that is 8 or more characters") 
     
      redirect '/users/register'
    end

    if user.password != params[:passwordtwo]
      session[:logged_in] = false
      session[:message] = error_message("Passwords do not match up please try again")
       
      redirect '/users/register'
    end
   
    user.save
      
      session[:logged_in] = true
      session[:username] = user.username
      session[:message] = success_message("Logged in as #{user.username}")
      
      redirect '/calories'
    else 
     
      session[:message] = error_message("Sorry, username #{params[:username]} is already taken.")
        
      redirect '/users/register'
    end
 end

  get '/logout' do
    username = session[:username]
    session.destroy
    session[:message] = neutral_message("User #{username} logged out." )

    redirect '/users/login'
  end
end
