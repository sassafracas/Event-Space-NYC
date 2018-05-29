# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.create(user_name:"u1", full_name:"user one", email:"u1@u1.com", password:"123")
u2 = User.create(user_name:"u2", full_name:"user two", email:"u2@u2.com",password:"abc")
u3 = User.create(user_name:"u3", full_name:"user three", email:"u3@u3.com", password:"efg")
u4 = User.create(user_name:"u4", full_name:"user four", email:"u4@u4.com", password:"xyz")
u5 = User.create(user_name:"u5", full_name:"user five", email:"u5@u5.com", password:"123xyz")

c1 = Category.create(name:"Art")
c2 = Category.create(name:"Concert")
c3 = Category.create(name:"Family Event")
c4 = Category.create(name:"Kids Event")

l1 = Location.create(longitude:-74.0140249,latitude:40.7052799, neighborhood: "lower manhattan")
l2 = Location.create(longitude:-73.97907789999999,latitude:40.7641791, neighborhood: "midtown")
l3 = Location.create(longitude:-73.9653551,latitude:40.7828647, neighborhood: "Central Park")



e1 = Event.create(title: "Art show", description:"only arts", location:l1, category:c1)
e2 = Event.create(title: "Concert show", description:"sing", location:l2, category:c2)
e3 = Event.create(title: "Runs with kids", description:"parks", location:l3, category:c4)
e4 = Event.create(title: "Arts again", description:"parks", location:l3, category:c4)
e5 = Event.create(title: "Sing with Sang", description:"as title", location:l3, category:c2)
e6 = Event.create(title: "Art with Aleks", description:"as title", location:l1, category:c1)
e7 = Event.create(title: "together ", description:"as title", location:l3, category:c3)

u1.events << e1
u1.events << e2
u1.events << e3
u1.events << e4

u2.events << e2
u2.events << e3
u2.events << e5

u3.events << e1
u3.events << e2
u3.events << e5
