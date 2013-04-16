# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' },
  { :name => 'user' },
  { :name => 'VIP' }
], :without_protection => true)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :first_name => 'Tong', :last_name => 'Ha', :email => 'tong.d.ha@gmail.com', :password => 'mimi168899', :password_confirmation => 'mimi168899'
puts 'New user created: ' << user.first_name
user2 = User.create! :first_name => 'Guillermo', :last_name => 'Pont', :email => 'guillermopont@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'New user created: ' << user2.first_name
user.add_role :admin
user2.add_role :user
