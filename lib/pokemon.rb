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
          INSERT INTO pokemon (name, type, db)
          VALUES (?,?,?)
          SQL
    db.execute(sql, name, type, db)
    @id = db.execute("SELECT last_insert_rowid() FROM students")
  end
end
