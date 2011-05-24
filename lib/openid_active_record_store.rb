require 'rails/engine'
require 'openid/store/active_record'

module OpenidActiveRecordStore
  class Engine < Rails::Engine
    config.eager_load_paths << File.expand_path("../../app/models", __FILE__)
  end
  class Railtie < Rails::Railtie
    rake_tasks do
      namespace :openid_active_record_store do
        namespace :install do
          desc "install migrations"
          task :migrations => %w[db/migrations/create_openid_associations.rb db/migrations/create_openid_nonces.rb]

          cp_task = lambda do |t|
            basename = File.basename(t.name)
            cp File.expand_path("../../db/migrations/#{basename}", __FILE__), t.name
          end

          file 'db/migrations/create_openid_associations.rb', &cp_task

          file 'db/migrations/create_openid_nonces.rb', &cp_task

        end
      end
    end unless Gem::Version.new(Rails.version) >= Gem::Version.new('3.1.0')
  end
end