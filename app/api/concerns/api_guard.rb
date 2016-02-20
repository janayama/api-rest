require 'rack/oauth2'

module APIGuard
  extend ActiveSupport::Concern

  included do
    helpers HelperMethods
  end

  # Helper Methods for Grape Endpoint
  module HelperMethods
  end

  module ClassMethods
  end
end