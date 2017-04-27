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
  image_url: 'http://howafrica.com/wp-content/uploads/2015/11/0x600.jpg',
)

City.create(
  name: 'London',
  image_url: 'http://www.pokerstarslive.com/assets/common/images/page-headers/festival-london.jpg',
)

City.create(
  name: 'San Francisco',
  image_url: 'https://d1udkpklcxvaqz.cloudfront.net/sites/default/files/styles/img-venue-slider-home/public/sf-slider-1.jpg?itok=aDIO_Atb',
)
