class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :first, :last, :street, :city, :zip, :state, :country, :email, :username, :password, presence: true 
  has_many :phones

end
