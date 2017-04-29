# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.destroy_all
Post.destroy_all

City.create(
  name: 'Atlanta',
  image_url: 'https://en.wikipedia.org/wiki/Atlanta#/media/File:Atlanta_Downtown_Skyline.jpg',
)

City.create(
  name: 'London',
  image_url: 'http://www.pokerstarslive.com/assets/common/images/page-headers/festival-london.jpg',
)

City.create(
  name: 'San Francisco',
  image_url: 'http://cdn.lightgalleries.net/4bd5ebf463380/images/pano20-ship-final2-1.jpg',
)
