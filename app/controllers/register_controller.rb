class RegisterController < ApplicationController
  def index

  end

  def registeruser
    user = User.new
    number = Phone.new
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
    number.phone = params[:phone1]
    number.user_id = user.id
    number.save
    redirect_to '/'
  end

end
