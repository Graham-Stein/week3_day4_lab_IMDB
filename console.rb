require('pry')
require_relative('models/actors.rb')
require_relative('models/movies.rb')
require_relative('models/roles.rb')


Roles.delete_all()
Actor.delete_all()
Movie.delete_all()


actor1 = Actor.new({
  'f_name' => 'Bruce',
  'l_name' => 'Willis'
  })

actor2 = Actor.new({
  'f_name' => 'Emma',
  'l_name' => 'Watson'
  })

actor1.save
actor2.save

actors = Actor.all()

movie1 = Movie.new({
  'title' => 'Pulp Fiction',
  'genre' => 'Art House'
  })

movie2 = Movie.new({
  'title' => 'Die Hard',
  'genre' =>'Action'
  })

movie3 = Movie.new({
  'title' => 'Harry Potter',
  'genre' => 'Fantasy'
  })

movie4 = Movie.new({
    'title' => 'Beauty and the Beast',
    'genre' => 'Kids Movie'
    })

movie1.save
movie2.save
movie3.save
movie4.save

role1 = Roles.new({
  'id_actor' => actor1.id,
  'id_movie' => movie1.id,
  'fee' => 1000000
  })
role2 = Roles.new({
    'id_actor' => actor1.id,
    'id_movie' => movie2.id,
    'fee' => 2000000
    })

role3 = Roles.new({
  'id_actor' => actor2.id,
  'id_movie' => movie3.id,
  'fee' => 100000
  })

role4 = Roles.new({
    'id_actor' => actor2.id,
    'id_movie' => movie4.id,
    'fee' => 500000
    })

role1.save
role2.save
role3.save
role4.save

binding.pry
nil
