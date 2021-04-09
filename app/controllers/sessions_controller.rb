class SessionsController < ApplicationController

    def omniauth #log users in with omniauth
        user_info = request.env['omniauth.auth']
    end
end