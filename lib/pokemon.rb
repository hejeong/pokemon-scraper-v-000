class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(name:, type:, db:, id: nil)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    sql = <<-SQL
          INSERT INTO pokemon (name, type)
          VALUES (?,?)
          SQL
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")
  end

  def self.find(id, db)
    sql = <<-SQL
          SELECT * FROM pokemon WHERE id = ?
          SQL
    row = db.execute(sql, id)[0]
    
  end
end
