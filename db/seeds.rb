# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

u1 = User.create(:name => "Phani", :email => 'ganti.phani@gmail.com', :contact => "084384480", :password => 'chicken', :password_confirmation => 'chicken', :city => 'Hyderabad')
u2 = User.create(:name => "Kumar", :email => 'ganti.phani@hotmail.com', :contact => "043400400", :password => 'chicken', :password_confirmation => 'chicken', :city => 'Hyderabad')
u3 = User.create(:name => "Bingo", :email => 'gpk08@yahoo.com', :contact => "046645432", :password => 'chicken', :password_confirmation => 'chicken', :city => 'Vizag')
u4 = User.create(:name => "Chingo", :email => 'satya@gmail.com', :contact => "0466271423", :password => 'chicken', :password_confirmation => 'chicken', :city => 'Chennai')


Location.destroy_all
loc1 = Location.create(:name => "Sydney", :latitude => -33, :longitude => 151)
loc2 = Location.create(:name => "Melbourne", :latitude => -37, :longitude => 144)
loc3 = Location.create(:name => "Perth", :latitude => -31, :longitude => 115)

u1.location << loc1
u2.location << loc1
u2.location << loc2
u2.location << loc3
u3.location << loc2
u3.location << loc1
u4.location << loc3
