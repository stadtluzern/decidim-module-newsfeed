# frozen_string_literal: true

source 'https://rubygems.org'

ruby RUBY_VERSION

DECIDIM_VERSION = 'v0.24.2'

gem 'decidim', git: 'https://github.com/decidim/decidim', tag: DECIDIM_VERSION
gem 'decidim-newsfeed', path: '.'

gem 'bootsnap', '~> 1.4'
gem 'puma', '>= 4.3'

group :development, :test do
  gem 'byebug', '~> 11.0', platform: :mri

  gem 'decidim-dev', git: 'https://github.com/decidim/decidim', tag: DECIDIM_VERSION
end

group :development do
  gem 'faker', '~> 2.14'
  gem 'letter_opener_web', '~> 1.3'
  gem 'listen', '~> 3.1'
  gem 'spring', '~> 2.0'
  gem 'spring-watcher-listen', '~> 2.0'
  gem 'web-console', '~> 3.0'
end
