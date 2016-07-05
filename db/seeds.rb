# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




r1 = Role.create({name: "Regular", description: "Can read items"})
r2 = Role.create({name: "Editor", description: "Can read and create items. Can update and destroy own items"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})


schools = LiveSchool.create([
	{ name: "台灣科技大學" },
	{ name: "東吳大學" }
])

departments = LiveDepartment.create([
	{ name: "企管系" },
	{ name: "工業管理系" }
])

lives = Live.create([
	{ name: "張維家", live_school_id: 1, live_department_id: 2 },
	{ name: "宋思育", live_school_id: 2, live_department_id: 1 }
])

times = LiveTime.create([
	{ start: "2016-02-22 11:30:00", end: "2016-02-22 12:00:00" },
	{ start: "2016-02-22 11:00:00", end: "2016-02-22 11:30:00" }
])

=begin
u1 = User.create({account_name: "Sally", email: "sally@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
u2 = User.create({account_name: "Sue", email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u3 = User.create({account_name: "Kev", email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u4 = User.create({account_name: "Jack", email: "jack@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})

i1 = Poster.create({name: "Rayban Sunglasses", description: "Stylish shades", user_id: u2.id})
i2 = Poster.create({name: "Gucci watch", description: "Expensive timepiece", user_id: u2.id})
i3 = Poster.create({name: "Henri Lloyd Pullover", description: "Classy knitwear", user_id: u3.id})
i4 = Poster.create({name: "Porsche socks", description: "Cosy footwear", user_id: u3.id})
=end