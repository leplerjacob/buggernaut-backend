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
Task.destroy_all
ProjectManager.destroy_all
Comment.destroy_all
Ticket.destroy_all

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

dev =
  User.create!(
    first_name: 'Johnny',
    last_name: 'Jackson',
    username: 'jjackson',
    email: 'jj@email.com',
    phone_number: '444-333-2222',
    role: 'Developer',
    password: 'john',
    password_confirmation: 'john'
  )

dev2 =
  User.create!(
    first_name: 'Amy',
    last_name: 'Peters',
    username: 'apeters',
    email: 'ap@email.com',
    phone_number: '777-455-9999',
    role: 'Developer',
    password: 'peters',
    password_confirmation: 'peters'
  )

dev3 =
  User.create!(
    first_name: 'Bob',
    last_name: 'Burnquist',
    username: 'bob',
    email: 'bburn@email.com',
    phone_number: '111-916-9999',
    role: 'Developer',
    password: 'bob',
    password_confirmation: 'bob'
  )

dev4 =
  User.create!(
    first_name: 'Sam',
    last_name: 'Club',
    username: 'sclub@email.com',
    email: 'sc@email.com',
    phone_number: '888-999-4343',
    role: 'Developer',
    password: 'sam',
    password_confirmation: 'sam'
  )

# ************************ #
# ***** PROJECT ONE ****** #
# ************************ #
task_for_project_one =
  Task.new(
    title: 'Create validators for registration',
    description:
      'Use rails built-in validation features to enforce required standards upon user registration',
    completed: false,
    user_id: jacob.id,
    assigned_to_id: dev2.id
  )

task_two_for_project_one =
  Task.new(
    title: 'Implement association between User and Home',
    description:
      'Using rails built-in association functions, build a has_one relation between User and Home model',
    completed: false,
    user_id: jacob.id,
    assigned_to_id: dev.id
  )

project_one =
  Project.new(
    title: 'Build User Authentication',
    description:
      'To build user registration, login functionality along with authentication and validations',
    date_start: '2021-04-10'.to_date,
    date_end: '2021-04-15'.to_date,
    est_duration: '5 days',
    time_spent: '',
    completed: false
  )

project_one.tasks << task_for_project_one
project_one.tasks << task_two_for_project_one
project_one.save

pm_1 = ProjectManager.create(user_id: jacob.id, project_id: project_one.id)
# ************************ #
# ***** PROJECT ONE ****** #
# ************************ #

# ************************ #
# ***** PROJECT TWO ****** #
# ************************ #
task_for_project_two =
  Task.new(
    title: 'Develop component tree',
    description: 'Map out the component tree for client backend system',
    completed: false,
    user_id: jacob.id,
    assigned_to_id: dev3.id
  )

task_two_for_project_two =
  Task.new(
    title: 'Implement association between User and Home',
    description:
      'Using rails built-in association functions, build a has_one relation between User and Home model',
    completed: false,
    user_id: jacob.id,
    assigned_to_id: dev4.id
  )

project_two =
  Project.new(
    title: 'Build UI for new app',
    description:
      "Using the latest framework version provided by our vendors, we need to build a user interface for our client's needs",
    date_start: '2021-04-22'.to_date,
    date_end: '2021-05-06'.to_date,
    est_duration: '2 weeks',
    time_spent: '',
    completed: false
  )

project_two.tasks << task_for_project_two
project_two.tasks << task_two_for_project_two
project_two.save

pm_2 = ProjectManager.create(user_id: jacob.id, project_id: project_two.id)
# ************************ #
# ***** PROJECT TWO ****** #
# ************************ #

# New first then shovel to Project.tickets
ticket_one =
  Ticket.new(
    title: "Can't push application.yml keys to heroku",
    description:
      "I'm trying to push my application.yml keys to heroku with the command figaro heroku:set -e production but I'm getting the following error... Please specify a version along with Heroku's API MIME type. For example, 'Accept: application/vnd.heroku+json; version=3'. I'm on Ubuntu 16.04, I've tried to reinstall heroku as a standalone and through npm, still getting the same error. HELP",
    resolved: false,
    created_by_id: dev.id
  )

project_one.tickets << ticket_one
ticket_one.save
