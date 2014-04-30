# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Link.destroy_all
Link.create user_id: 2, title: "2+2 - Best poker discussion board", address: "www.twoplustwo.com"

Vote.create user_id: 2, link_id: 9
