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

          files = File.expand_path("../../db/migrate/*.rb", __FILE__)
          sources = FileList[files]
          targets = sources.map do |source|
            ts = Time.now.to_f.to_s.sub('.', '')
            "db/migrate/#{ts}_#{File.basename(source)}"
          end

          desc "install migrations"
          task :migrations => targets

          sources.zip(targets).each do |source, target|
            file target => source do
              cp source, target
            end
          end

        end
      end
    end unless Gem::Version.new(Rails.version) >= Gem::Version.new('3.1.0')
  end
end