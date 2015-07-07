# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.destroy_all
Category.destroy_all

category = Category.create!(title: 'Books')

Product.create!(title: 'ruby book', description: 'description 1', price: 12.99, published: true, category: category)
Product.create!(title: 'jquey book', description: 'description 1', price: 11.99, published: true, category: category)
Product.create!(title: 'sass book', description: 'description 1', price: 10.99, published: true, category: category)

