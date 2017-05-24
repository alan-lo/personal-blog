# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Like.delete_all
User.delete_all
Category.delete_all
Post.delete_all

User.create({first_name: 'Alan', last_name:'Lo', email:'alan@gmail.com', password:'alan', is_admin: 'true'})
User.create({first_name: 'John', last_name:'Smith', email:'john@gmail.com', password:'john' , is_admin: 'false'})
User.create({first_name: 'goofy', last_name:'gamer', email:'goofygamer@gmail.com', password:'goofy' , is_admin: 'false'})

Category.create(name: 'Personal')
Category.create(name: 'Business')
Category.create(name: 'Just For Fun')
