# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_tweets =
  [
    {id: 1, body: 'hey there', created_at: 100.days.ago, updated_at: 100.days.ago, user_id: 1, in_reply_to: nil},
    {id: 2, body: 'hey myles', created_at: 99.days.ago, updated_at: 99.days.ago, user_id: 2, in_reply_to: 1},
    {id: 3, body: 'hey faryar', created_at: 98.days.ago, updated_at: 98.days.ago, user_id: 1, in_reply_to: 2},
    {id: 4, body: 'hey jack', created_at: 97.days.ago, updated_at: 97.days.ago, user_id: 2, in_reply_to: 1},
    {id: 5, body: 'hey connor', created_at: 96.days.ago, updated_at: 96.days.ago, user_id: 1, in_reply_to: 3},
    {id: 6, body: 'hey graham', created_at: 95.days.ago, updated_at: 95.days.ago, user_id: 2, in_reply_to: 2}
  ]

seed_tweets.each do |tweet|
  Tweet.create!(tweet, without_protection: true)
end


