# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
PersonalTitle.create([{title: 'Dr'}, {title: 'Miss'}, {title: 'Mr'}, {title: 'Mrs'}, {title: 'Ms'}])
Gender.create([{name: 'Female'}, {name: 'Male'}])