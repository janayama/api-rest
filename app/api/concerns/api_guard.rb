require 'rack/oauth2'

module APIGuard
  extend ActiveSupport::Concern

  included do
    	# OAuth2 Resource Server Authentication
    	use Rack::OAuth2::Server::Resource::Bearer, 'The API' do |request|
      request.access_token
    end

    helpers HelperMethods
  end

  # Helper Methods for Grape Endpoint
  module HelperMethods
		private
		def get_token_string
			# The token was stored after the authenticator was invoked.
			# It could be nil. The authenticator does not check its existence.
			request.env[Rack::OAuth2::Server::Resource::ACCESS_TOKEN]
		end

		def find_access_token(token_string)
			Doorkeeper::AccessToken.authenticate(token_string)
 		end

		def validate_access_token(access_token, scopes)
 			Oauth2::AccessTokenValidationService.validate(access_token, scopes: scopes)
 		end
	end

  module ClassMethods
  end
end