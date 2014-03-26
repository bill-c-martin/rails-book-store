Product.delete_all

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
      <p>Since we're all going to die, it's obvious that when and how don't matter.</p>
    },
  image_url: 'the_stranger_cover.jpg',
  price: 14.99
)

Product.create(
  title: 'Servant of the Shard',
  description: %{
    <p>It did not take me long, however, to discover one nemesis that I could neither defeat nor flee. It followed me wherever I went - indeed, the farther I ran, the more it closed in around me. My enemy was solitude, the interminable, incessant silence of hushed corridors.</p>
  },
  image_url: 'servant_of_the_shard_cover.jpg',
  price: 4.99
)

Product.create(
    title: 'The Name of the Wind',
    description: %{
        <p>The day we fret about the future is the day we leave our childhood behind.</p>
    },
    image_url: 'name_of_the_wind.jpg',
    price: 14.99
)

Product.create(
    title: 'Cat\'s Cradle',
    description: %{
      <p>Tiger got to hunt, bird got to fly; <br/>Man got to sit and wonder 'why, why, why?'<br/>Tiger got to sleep, bird got to land;<br/>Man got to tell himself he understand</p>
    },
    image_url: 'cats_cradle.jpg',
    price: 10.99
)

Product.create(
    title: '1984',
    description: %{
      <p>If you want a picture of the future, imagine a boot stamping on a human face, forever</p>
    },
    image_url: '1984.jpg',
    price: 6.99
)

Product.create(
    title: 'A Game of Thrones',
    description: %{
      <p>There is only one god and his name is Death. And there is only one thing we say to Death: "Not today."/p>
    },
    image_url: 'a_game_of_thrones.jpg',
    price: 9.99
)