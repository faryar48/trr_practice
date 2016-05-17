# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  {
    id: 1,
    name: "Alan"
  },
  {
    id: 2,
    name: "Bobo"
  },
  {
    id: 3,
    name: "Cameron"
  },
  {
    id: 4,
    name: "David"
  },
  {
    id: 5,
    name: "Emerson"
  },
  {
    id: 6,
    name: "Felicia"
  },
  {
    id: 7,
    name: "Gertrude"
  }
]

users.each { |u| User.create(u) }

personal_websites = [
  {
    id: 1,
    user_id: 1,
    name: "Alan.com"
  },
  {
    id: 2,
    user_id: 2,
    name: "Bobo.com"
  },
  {
    id: 3,
    user_id: 3,
    name: "Cameron.com"
  },
  {
    id: 4,
    user_id: 4,
    name: "David.com"
  },
  {
    id: 5,
    user_id: 5,
    name: "Emerson.com"
  },
  {
    id: 6,
    user_id: 6,
    name: "Felicia.com"
  },
  {
    id: 7,
    user_id: 7,
    name: "Gertrude.com"
  }
]

personal_websites.each { |site| PersonalWebsite.create(site) }

headings = [
  { # Alan
    website_id: 1,
    level: 1,
    value: "Cats",
  },
  { # Felicia
    website_id: 6,
    level: 1,
    value: "Fashion",
  }
]

headings.each { |h| Heading.create(h) }

friendship_list = [
  [1, 2],
  [1, 5],
  [2, 3],
  [3, 5],
  [3, 4],
  [4, 6],
  [5, 6],
  [6, 7],
  [1, 7],
]

friendship_list.each do |(from, to)|
  Friendship.create({ from: from, to: to })
  Friendship.create({ from: to, to: from })
end
