require 'rails/engine'
require 'openid/store/active_record'

module OpenidActiveRecordStore
  class Engine < Rails::Engine
    config.eager_load_paths << File.expand_path("../../app/models", __FILE__)
  end
end