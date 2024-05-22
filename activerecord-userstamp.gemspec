# frozen_string_literal: true

require_relative 'lib/userstamp/version'

Gem::Specification.new do |s|
  s.name = 'activerecord-userstamp'
  s.version = Userstamp::VERSION
  s.authors = ['Eko Widianto']
  s.email = ['ekowidianto@outlook.com']

  s.summary = 'Adds magic creator and updater attributes to your ActiveRecord models.'
  s.description = 'This gem extends ActiveRecord::Base to add automatic updating of created_by and updated_by attributes of your models in much the same way that the ActiveRecord::Timestamp module updates created_(at/on) and updated_(at/on) attributes.'
  s.homepage = 'https://github.com/Coursemology/activerecord-userstamp'
  s.license  = 'MIT'
  s.required_ruby_version = '>= 2.7.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'rails', '>= 6.0.0'

  s.add_development_dependency 'tzinfo-data' if RUBY_PLATFORM =~ /mswin|mingw/
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'rspec-rails', '>= 3.3'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'sqlite3'
end
