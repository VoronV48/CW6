# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create!(name: "Admin", email: "admin1@bla.com", password: "123123", password_confirmation: "123123", admin: true)
user1 = User.create!(name: "user1", email: "user1@bla.com", password: "123123", password_confirmation: "123123", admin: false)
user2 = User.create!(name: "user2", email: "user2@bla.com", password: "123123", password_confirmation: "123123", admin: false)
