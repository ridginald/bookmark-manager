require 'pg'

class Bookmark
  def self.all
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'bookmark_manager_test')
      else
        connection = PG.connect(dbname: 'bookmark_manager')
      end

      result = connection.exec("SELECT * FROM bookmarks")
      result.map { |link| link['url'] }
    end

    def self.create(options)
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'bookmark_manager_test')
      else
        connection = PG.connect(dbname: 'bookmark_manager')
      end

      connection.exec("INSERT INTO bookmarks (url) VALUES('#{options[:url]}')")
    end
end
