require_relative("../db/sql_runner")

class Movie

attr_reader  :id
attr_accessor :title, :genre

def initialize(options)
  @id = options['id'].to_i()
  @title = options['title']
  @genre = options['genre']
end

def save()

sql = "INSERT INTO movies (
title,
genre
) VALUES ($1, $2)
RETURNING id;"

 values = [@title, @genre]

result = SqlRunner.run(sql,values)
@id = result[0]['id'].to_i

end

def self.all()

sql = "SELECT * FROM movies"
movies = SqlRunner.run(sql)
movie_objects = movies.map do |a|
  Movie.new(a)
end
return movie_objects
end

def self.delete_all()
sql  = "DELETE FROM movies"
SqlRunner.run(sql)
end

def update()
sql = "UPDATE movies SET
    (title,
    genre) = ($1, $2)
    WHERE id = $3;"

values = [@title, @genre, @id]
SqlRunner.run(sql,values)
end





end
