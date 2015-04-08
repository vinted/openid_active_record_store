# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{vinted-openid_active_record_store}
  s.version = "1.1.1"
  s.authors = ['Tomas Varneckas', 'James Tucker', 'Kazuyoshi Tlacaelel']
  s.email = 'tomas.varneckas@vinted.com'
  s.homepage = 'http://github.com/vinted/openid_active_record_store'

  s.date = %q{2011-05-24}
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.3}
  s.summary = 'An ActiveRecord store for OpenID'
  s.description = 'An ActiveRecord store for OpenID, forked from a form Rails 4.2 support'

  s.files = `git ls-files`.split - %W[.gitignore #{File.basename __FILE__}]

  s.add_dependency 'rails', '~> 4.0'
  s.add_dependency 'protected_attributes', '~> 1.0'
  s.add_dependency 'ruby-openid', '~> 2.5'
end
