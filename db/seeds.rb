# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  (1..30).each do |num|
    Upost.create(user_id: 1, title: "don kim's placeholder_#{num}", content: "don kim's content i love you man this is placeholder content hello", category: "#{(num%3)+1}")
  end
end
#if Rails.env.development?
#    Upost.delete_all
#end
