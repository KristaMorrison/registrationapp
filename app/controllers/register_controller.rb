class RegisterController < ApplicationController
  def index
  end
  #method to store user input into the database. If a field is empty, don't save an empty string into the database.
  def registeruser
    user = User.new
    user.first = params[:first_name] unless params[:first_name].strip.empty?
    user.last = params[:last_name] unless params[:last_name].strip.empty?
    user.street = params[:street] unless params[:street].strip.empty?
    user.city = params[:city] unless params[:city].strip.empty?
    user.state = params[:state] unless params[:state].strip.empty?
    user.zip = params[:zip] unless params[:zip].strip.empty?
    user.country = params[:country] unless params[:country].strip.empty?
    user.email = params[:email] unless params[:email].strip.empty?
    user.username = params[:username]
    user.password = params[:password]
    user.save
    #Only add a phone number to the database if a number is entered.
    if !params[:phone1].strip.empty?
      number = Phone.new
      number.phone = params[:phone1]
      number.user_id = user.id
      number.save
    end
    if !params[:phone2].strip.empty?
      number = Phone.new
      number.phone = params[:phone2]
      number.user_id = user.id
      number.save
    end
    if !params[:phone3].strip.empty?
      number = Phone.new
      number.phone = params[:phone3]
      number.user_id = user.id
      number.save
    end
    #After registration is complete, user is taken to a confirmation page.
    redirect_to '/register/confirmation'
  end

  def login

  end

  def userlogin
    @user = User.find_by username: params[:username]
    if @user.nil?
      flash[:notice] = "Username is not valid"
      redirect_to '/register/login'
    elsif @user.password != params[:password]
      flash[:notice] = "Password is not valid"
      redirect_to '/register/login'
    else
      session[:user] = @user.first.to_yaml
      redirect_to '/register/welcome'
    end
  end

  
end
