# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Player.find_or_create_by(id: 1, name: 'Luiz')
Player.find_or_create_by(id: 2, name: 'Fernando')
Player.find_or_create_by(id: 3, name: 'Lobo')
Player.find_or_create_by(id: 4, name: 'Bosso')
