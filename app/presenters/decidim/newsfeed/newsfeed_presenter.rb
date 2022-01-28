# frozen_string_literal: true

module Decidim
  module Newsfeed
    # TODO: doc
    #
    class NewsfeedPresenter < Rectify::Presenter
      attribute :organization, Decidim::Organization
      attribute :page, Integer
      attribute :query, String

      def count
        unsorted_newsfeed_posts.count
      end

      def render_pagination
        paginate collection, theme: 'decidim'
      end

      def render_current_page
        render collection: decorated_newsfeed_posts, partial: 'newsfeed_blog_post'
      end

      private

      def collection
        @collection ||= newsfeed_posts.page(page).per(20)
      end

      def decorated_newsfeed_posts
        collection.map { |i| ::Decidim::Blogs::PostPresenter.new(i) }
      end

      def unsorted_newsfeed_posts
        @unsorted_newsfeed_posts ||=
          if query.present?
            r = Decidim::Search.call query, organization, resource_type: 'Decidim::Blogs::Post'
            r.dig :ok, 'Decidim::Blogs::Post', :results
          else
            NewsfeedBlogPosts.new(organization).query
          end
      end

      def newsfeed_posts
        if query.present?
          session[:newsfeed_ordering] = nil
          unsorted_newsfeed_posts
        else
          unsorted_newsfeed_posts.reorder Hash[[session_ordering]]
        end
      end

      def session_ordering
        session[:newsfeed_ordering] ||= %i[id asc]
      end
    end
  end
end
