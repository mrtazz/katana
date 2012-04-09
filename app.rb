require 'guillotine'

module Katana
    class App < Guillotine::App
      adapter = Guillotine::Adapters::MemoryAdapter.new
      set :service => Guillotine::Service.new(adapter)

      # authenticate everything except GETs
      before do
        unless request.request_method == "GET"
          protected!
        end
      end

      get '/' do
        redirect 'https://google.com'
      end

      # helper methods
      helpers do

        # Private: helper method to protect URLs with Rack Basic Auth
        #
        # Throws 401 if authorization fails
        def protected!
          return unless ENV["HTTP_USER"]
          unless authorized?
            response['WWW-Authenticate'] = %(Basic realm="Restricted Area")
            throw(:halt, [401, "Not authorized\n"])
          end
        end

        # Private: helper method to check if authorization parameters match the
        # set environment variables
        #
        # Returns true or false
        def authorized?
          @auth ||=  Rack::Auth::Basic::Request.new(request.env)
          user = ENV["HTTP_USER"]
          pass = ENV["HTTP_PASS"]
          @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == [user, pass]
        end
      end

    end
end
