# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

gangsta = Category.create(name: 'Gangsta Rap')
mainstream = Category.create(name: 'Mainstream Rap')
mellow = Category.create(name: 'Mellow Rap')
underground = Category.create(name: 'Underground Rap')
fast = Category.create(name: 'Fast Rap')
battle = Category.create(name: 'Battle Rap')

user = User.create(email: 'mike@mike.com', password: 'Redbull5', name: 'Mike The Man')

30.times do 
	Track.create(body: 'First Track', user_id: 1, category_id: rand(1..6))
end
