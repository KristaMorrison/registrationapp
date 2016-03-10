class RegisterController < ApplicationController
  #Method that runs when index page first loads
  def index
  end

  #method to store user input into the database. If a field is empty, don't save an empty string into the database.
  def registeruser
    if !(User.find_by username: params[:username]).nil?
      flash[:notice] = "Username taken, try another"
      redirect_to "/"
    elsif params[:first_name].strip.empty? || params[:last_name].strip.empty? || params[:street].strip.empty? || params[:city].strip.empty? || params[:state].strip.empty? || params[:zip].strip.empty? || params[:country].strip.empty? || params[:email].strip.empty?
      flash[:notice] = "Invalid characters entered"
      redirect_to "/"
    else
      user = User.new
      user.first = params[:first_name]
      user.last = params[:last_name]
      user.street = params[:street]
      user.city = params[:city]
      user.state = params[:state]
      user.zip = params[:zip]
      user.country = params[:country]
      user.email = params[:email]
      user.username = params[:username]
      user.password = params[:password]
      user.save
      #Only add a phone number to the database if a number is entered.
      if !params[:phone1].strip.empty?
        phone = Phone.new
        phone.phone = params[:phone1]
        user.phones << phone
        phone.save
      end
      if !params[:phone2].strip.empty?
        phone = Phone.new
        phone.phone = params[:phone2]
        user.phones << phone
        phone.save
      end
      if !params[:phone3].strip.empty?
        phone = Phone.new
        phone.phone = params[:phone3]
        user.phones << phone
        phone.save
      end
      #After registration is complete, user is taken to a confirmation page.
      redirect_to '/register/confirmation'
    end
  end

  #Method that runs when the login page first loads
  def login
  end

  #Method that allows user to log in - Checks database to ensure user info is valid - This method only runs when the user clicks submit on the login page
  def userlogin
    #Search the database for a record that matches the name input by the user
    @user = User.find_by username: params[:username]
    #if the username input is invalid flash notice appears and redirects back to login
    if @user.nil?
      flash[:notice] = "Username is not valid"
      redirect_to '/register/login'
    #if password is invalid flash notice appears and redirects back to login
    elsif @user.password != params[:password]
      flash[:notice] = "Password is not valid"
      redirect_to '/register/login'
    #if everything is valid redirect to welcome page and store user id as a cookie
    else
      session[:id] = @user.id
      redirect_to '/register/welcome'
    end
  end

  #Method to find the user in the database
  def welcome
    @user = User.find_by id: session[:id]
    @phones = @user.phones
  end

  #Method which runs when the user clicks the logout button. The session is reset, and the user is redirected to the index registration page
  def logout
    reset_session
    redirect_to "/"
  end

end
