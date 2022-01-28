# frozen_string_literal: true

require 'rails'
require 'active_support/all'

require 'decidim/core'
require 'sanitize'

module Decidim
  module Newsfeed
    # This is the engine that runs on the public interface of newsfeed.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Newsfeed

      routes do
        # Add engine routes here
        # resources :newsfeed, only: :index, as: 'newsfeed', path: 'newsfeed'
        get 'newsfeed', to: 'newsfeed#index', as: 'newsfeed'
        # root to: 'newsfeed#index'
      end

      initializer 'Newsfeed.webpacker.assets_path' do
        # Decidim.register_assets_path File.expand_path('app/packs', root)
      end

      initializer 'decidim_newsfeed.menu' do
        Decidim.menu :menu do |menu|
          menu.item I18n.t('menu.newsfeed', scope: 'decidim'),
                    decidim_newsfeed.newsfeed_path,
                    position: 5,
                    active: :inclusive
        end
      end
    end
  end
end
