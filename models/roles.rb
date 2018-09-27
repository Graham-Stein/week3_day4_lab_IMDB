require_relative("../db/sql_runner")

class Roles

  attr_reader  :id, :id_actor, :id_movie
  attr_accessor :fee

    def initialize(options)
      @id = options['id'].to_i()
      @id_actor = options['id_actor']
      @id_movie = options['id_movie']
      @fee = options['fee'].to_i()
    end

    def save()

    sql = "INSERT INTO roles (
          id_actor,
          id_movie,
          fee
          ) VALUES ($1, $2, $3)
          RETURNING id;"

     values = [@id_actor, @id_movie, @fee]

    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i

    end

    def self.all()

    sql = "SELECT * FROM roles"
    roles = SqlRunner.run(sql)
    roles_objects = roles.map do |a|
      Roles.new(a)
    end
    return roles_objects
    end

    def self.delete_all()
    sql  = "DELETE FROM roles"
    SqlRunner.run(sql)
    end

    def update()
    sql = "UPDATE roles SET
        (
          id_actor,
          id_movie,
          fee)
          = ($1, $2, $3)
          WHERE id = $4;"

        values = [@id_actor, @id_movie, @fee, @id]
        SqlRunner.run(sql,values)

    end




end
