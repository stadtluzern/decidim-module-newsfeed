# frozen_string_literal: true

require 'rails'
require 'active_support/all'

require 'decidim/core'

module Decidim
  module Newsfeed
    # Decidim's Newsfeed Rails Admin Engine.
    # There is nothing to administer, it's 'only provided since Decidim
    # requires it.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::Newsfeed

      paths['db/migrate'] = nil
      paths['lib/tasks'] = nil

      routes do
        # Add admin engine routes here
        # resources :newsfeed do
        #   collection do
        #     resources :exports, only: [:create]
        #   end
        # end
        # root to: "newsfeed#index"
      end

      def load_seed
        nil
      end
    end
  end
end
