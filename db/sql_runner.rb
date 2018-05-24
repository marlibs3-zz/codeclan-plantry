require('pg')

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'da8tfqoa8eu457', host: 'ec2-23-21-129-50.compute-1.amazonaws.com
', port: 5432, user: 'prlazcuifmqbsf', password: 'e1658fafbcada95776029e82f96c62b0969679de5bbbd8a71a236350f24e97f4'})
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
