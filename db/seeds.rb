# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ************** SEED_ONE ************** #
# Currently only User model exists, with no associations set
# ************** ******** ************** #

User.destroy_all

jacob =
  User.create!(
    first_name: 'Jacob',
    last_name: 'Lepler',
    username: 'jacobgl',
    email: 'jacob@gmail.com',
    phone_number: '333-111-3311',
    role: 'Project Manager',
    password: 'jacob',
    password_confirmation: 'jacob'
  )
