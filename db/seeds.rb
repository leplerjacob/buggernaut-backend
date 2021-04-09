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
Project.destroy_all

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
  
  dev = User.create!(
    first_name: 'Johnny',
    last_name: 'Jackson',
    username: 'jjackson',
    email: 'jj@email.com',
    phone_number: '444-333-2222',
    role: 'Developer',
    password: 'john',
    password_confirmation: 'john'
  )

project_one =
  Project.create!(
    title: 'Build User Authentication',
    description:
      'To build user registration, login functionality along with authentication and validations',
    date_start: Date.today,
    date_end: '2021-04-15'.to_date,
    est_duration: '5 days',
    time_spent: '',
    status: false
  )

