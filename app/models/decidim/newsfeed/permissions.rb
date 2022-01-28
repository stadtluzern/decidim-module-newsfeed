# frozen_string_literal: true

module Decidim
  module Newsfeed
    # TODO: doc
    #
    class Permissions < Decidim::DefaultPermissions
      def permissions
        # unless user.is_a?(Decidim::User)
        #   permission_action.disallow!
        #   return permission_action
        # end

        return permission_action unless permission_action.subject == :newsfeed

        permission_action.allow! if permission_action.action == :view
        permission_action
      end
    end
  end
end
