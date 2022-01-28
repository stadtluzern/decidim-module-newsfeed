# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'decidim/newsfeed/version'

Gem::Specification.new do |s|
  s.version = Decidim::Newsfeed.version
  s.authors = ['Thomas Burkhalter']
  s.email = ['new.mysteryman@gmail.com']
  s.license = 'AGPL-3.0'
  s.homepage = 'https://github.com/decidim/decidim-module-newsfeed'
  s.required_ruby_version = '>= 2.7'

  s.name = 'decidim-newsfeed'
  s.summary = 'A decidim newsfeed module'
  s.description = 'Add a newsfeed to Decidim.'

  s.files = Dir['{app,config,lib}/**/*', 'LICENSE-AGPLv3.txt', 'Rakefile', 'README.md']

  s.add_dependency 'decidim-core', Decidim::Newsfeed.version
  s.add_dependency 'rails', '~> 5.2.0'
  s.add_dependency 'sanitize'
end
