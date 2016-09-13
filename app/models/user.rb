class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true, :uniqueness => true #The validation make sure teh users email is valid and unique and the password field is not blank
  has_and_belongs_to_many :location

end
