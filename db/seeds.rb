# frozen_string_literal:true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(first_name: 'Usman', last_name: 'Noor', phone_number: '03214004770', email: 'admin12@projectname.com',
              password: 'Password@123')
SuperAdmin.create!(first_name: 'SuperUs', last_name: 'Noor', phone_number: '03214042770', email: 'super@projectname.com',
                   password: 'Password@123')
