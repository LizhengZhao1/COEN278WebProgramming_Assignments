

require 'sinatra'
require 'sinatra/reloader' if development?
require './user.rb'

enable :sessions

get '/welcome' do
  erb(:welcome)
end

post '/backToWelcome' do
  redirect('/welcome')
end

post '/backToLogin' do
  redirect('/login')
end


get '/login' do
  erb(:login)
end

post '/login' do
  username = params[:username_login]
  password = params[:password_login]
  if(username == "" || password == "")
    session[:message] = "Invalid username or password, please login again"
    redirect('/login')
  end
  allusers = User.all
  allusers.each do |user|
    if user.username == username
      if(user.password == password)
        path = "/bet/#{user.id}"
        redirect(path)
      end
      session[:message] = "Password or username entered incorrectly, please try again"
      redirect('/login')
    end
  end
  session[:message] = "This user was not found. Please back to welcome page and sign Up first"
  redirect('/login')
end

get '/bet/:id' do
  if !session[:totalWin]
    session[:totalWin] = 0
  end

  if !session[:totalLoss]
    session[:totalLoss] = 0
  end

  if !session[:profit]
    session[:profit] = 0
  end
  @currentUser = User.get(params[:id])
  @path =  "/bet/#{params[:id]}"
  erb(:bet)
end

post '/bet/:id' do
  money = params[:money].to_i
  on = params[:on].to_i
  @currentUser = User.get(params[:id])
  if on < 1 || on > 6 || money <= 0
    session[:message] = "Please enter valid number"
    redirect("/bet/#{params[:id]}")
  else 
    if !session[:totalWin]
      session[:totalWin] = 0
    end
  
    if !session[:totalLoss]
      session[:totalLoss] = 0
    end
  
    if !session[:profit]
      session[:profit] = 0
    end
  
    dice = rand(6)+1
    if dice == on
      session[:totalWin] = session[:totalWin].to_i + money*10
      session[:profit] = session[:profit].to_i + money*10
      # @currentUser.update(:totalWin => session[:totalWin])
      # @currentUser.update(:totalProfit => session[:profit])
      # @currentUser.save
      session[:message] = "Congratulation! You just have won $#{money*10}!"
      redirect("/bet/#{params[:id]}")
    else
      session[:totalLoss] = session[:totalLoss].to_i + money
      session[:profit] = session[:profit].to_i - money
      # @currentUser.update(:totalLoss => session[:totalLoss])
      # @currentUser.update(:totalProfit => session[:profit])
      # # @currentUser.save
      session[:message] = "Oops... The dice is on #{dice}, You just have lost $#{money}."
      redirect("/bet/#{params[:id]}")
    end
  end
end

get '/signup' do
  erb(:signup)
end

post '/signup' do
  username = params[:username_signup]
  password = params[:password_signup]
  if username != "" && password != ""
    allusers = User.all
    allusers.each do |user|
      if user.username == username
        session[:message] = "Repeated username, please try another one"
        redirect('/signup')
      end
    end
    newUser = User.create(username: username, password: password, totalWin:0, totalLoss:0, totalProfit:0)
    session[:message] = "Sign up successfully! Please login to your account"
    redirect('/signup')
  else
    session[:message] = "Please enter valid username and password"
    redirect('/signup')
  end
end

post '/logout/:id' do
  @currentUser = User.get(params[:id])
  if !session[:totalWin]
    session[:totalWin] = 0
  end

  if !session[:totalLoss]
    session[:totalLoss] = 0
  end

  if !session[:profit]
    session[:profit] = 0
  end
  @currentUser.update(:totalWin => @currentUser.totalWin+session[:totalWin])
  @currentUser.update(:totalLoss => @currentUser.totalLoss+session[:totalLoss])
  @currentUser.update(:totalProfit => @currentUser.totalProfit+session[:profit])
  @currentUser.save
  session[:totalWin] = 0
  session[:totalLoss] = 0
  session[:profit] = 0
  redirect("/login")
end





