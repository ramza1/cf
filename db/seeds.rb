# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Blog.find_each do |story|
  story.update_attribute(:description, story.content.gsub(/<\/?[^>]*>/, "").squeeze(" ").strip[0..200])
end
