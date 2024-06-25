require 'active_record'

def connect_to_database
  ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'
end

def clear_database
  ActiveRecord::Base.descendants.each do |model|
    model.delete_all if model.table_exists?
  end
end

def reset_database
  ActiveRecord::Base.descendants.map(&:reset_column_information)
  ActiveRecord::Base.connection.disconnect!
  connect_to_database
end

def initialize_database(&block)
  reset_database
  ActiveRecord::Schema.define(&block)
end

def define_first_post
  @first_post = Post.create!(title: 'a title')
end

ActiveRecord::Migration.verbose = false
connect_to_database
