require_relative("../db/sql_runner")
require_relative('movies.rb')

class Actor

attr_reader  :id
attr_accessor :f_name, :l_name

def initialize(options)
  @id = options['id'].to_i()
  @f_name = options['f_name']
  @l_name = options['l_name']

end

  def movies()

    sql = "SELECT movies.* FROM movies
          INNER JOIN roles
          ON movies.id = roles.id_movie
          WHERE roles.id_actor = $1"

    values = [@id]
    result = SqlRunner.run(sql,values)
      movie_objects = result.map do |c|
        Movie.new(c)
      end

  return movie_objects

  end



def save()

sql = "INSERT INTO actors (
f_name,
l_name
) VALUES ($1, $2)
RETURNING id;"

 values = [@f_name, @l_name]

result = SqlRunner.run(sql,values)
@id = result[0]['id'].to_i

end

def self.all()

sql = "SELECT * FROM actors"
actors = SqlRunner.run(sql)
actor_objects = actors.map do |a|
  Actor.new(a)
end
return actor_objects
end

def self.delete_all()
sql  = "DELETE FROM actors"
SqlRunner.run(sql)
end

def update()
sql = "UPDATE actors SET
    (f_name,
    l_name) = ($1, $2)
    WHERE id = $3;"

values = [@f_name, @l_name, @id]
SqlRunner.run(sql,values)


end




end
