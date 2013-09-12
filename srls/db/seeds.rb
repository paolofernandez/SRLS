# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{email: 'admini@gmail.com', password: 'secret', password_confirmation: 'secret', rol: 1 },
    {email: 'transcriptor@gmail.com', password: 'secret', password_confirmation: 'secret', rol: 2 },
    {email: 'valdiador@gmail.com', password: 'secret', password_confirmation: 'secret', rol: 3 }])