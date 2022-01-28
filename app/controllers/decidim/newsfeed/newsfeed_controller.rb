# frozen_string_literal: true

module Decidim
  module Newsfeed
    # TODO: doc
    #
    class NewsfeedController < Decidim::ApplicationController
      include Decidim::NeedsPermission

      def index
        enforce_permission_to :view, :newsfeed
        @posts = NewsfeedPresenter.new(
          organization: current_organization,
          page: params[:page].to_i,
          query: params[:q]
        ).attach_controller self
      end

      private

      def permission_scope
        :global
      end

      def permission_class_chain
        [Decidim::Newsfeed::Permissions]
      end
    end
  end
end
