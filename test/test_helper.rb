require 'test/unit'
require 'openid/store/active_record'
require 'active_record'

db = {
  :adapter => :mysql2,
  :database => 'openid_active_record_store'
}

system "echo 'drop   database #{db[:database]};' | mysql5 -uroot" rescue nil
system "echo 'create database #{db[:database]};' | mysql5 -uroot"

ActiveRecord::Base.establish_connection db

# TODO removeme once the railtie bootstrap is used
Dir['app/models/*.rb'].each do |model|
  require File.expand_path(model)
end

Dir['migrations/*.rb'].each do |migration|
  require migration
  Object.const_get(File.basename(migration, '.rb').camelize).up
end