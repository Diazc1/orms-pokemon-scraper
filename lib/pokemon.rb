class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:nil, name:, type:, db:)
        @id = id 
        @name = name 
        @type = type
        @db = db
    end


#Saves an instance of a pokemon with the correct id
    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
    end


#finds a pokemon from the database by their id number and returns a new Pokemon object
    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"

        result = db.execute(sql, id)[0]
        Pokemon.new(id:result[0], name:result[1], type:result[2], db:db)
    end


end
