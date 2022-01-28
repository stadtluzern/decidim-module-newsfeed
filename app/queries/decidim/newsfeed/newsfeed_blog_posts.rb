# frozen_string_literal: true

module Decidim
  module Newsfeed
    # TODO: doc
    #
    class NewsfeedBlogPosts < Rectify::Query
      def initialize(organization)
        super
        @organization = organization
      end

      def query
        ::Decidim::Blogs::Post.where(
          id: ::Decidim::Blogs::Post
                .all
                .select { |post| post.organization == @organization }
                .select(&:visible?)
                .pluck(:id)
        )
      end
    end
  end
end
