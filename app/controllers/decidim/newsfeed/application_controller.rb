# frozen_string_literal: true

module Decidim
  module Newsfeed
    # This controller is the abstract class from which all other controllers of
    # this engine inherit.
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception
    end
  end
end
