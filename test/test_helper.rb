require 'minitest/autorun'
require 'rails'
require 'openid_active_record_store'
require 'active_record'

db = {
  adapter: :mysql2,
  database: 'openid_active_record_store',
  socket: '/tmp/mysql.sock',
  username: 'root',
  password: 'a'
}

system "echo 'drop   database #{db[:database]};' | mysql" rescue nil
system "echo 'create database #{db[:database]};' | mysql"

ActiveRecord::Base.establish_connection db

Dir['db/migrate/*.rb'].each do |migration|
  load migration
  name = File.basename(migration, '.rb').gsub(/\A\d+_/, '')
  Object.const_get(name.camelize).up
end

Dir['app/models/*.rb'].each do |model|
  require File.expand_path(model)
end
