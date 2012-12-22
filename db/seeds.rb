# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.create(
  title: 'The Stranger',
  description:
    %{
      <p>
        The Stranger is about some weird ass guy that's introverted and is totally disconnected with his eomtions
      </p>
    },
  image_url: 'the_stranger_cover.jpg',
  price: 14.99
)

Product.create(
    title: 'Servant of the Shard',
    description:
      %{
        <p>
          Assassin Artemis Entreri and dark elf Jarlaxle.
        </p>
      },
    image_url: 'servant_of_the_shard_cover.jpg',
    price: 4.99
)