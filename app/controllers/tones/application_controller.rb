module Tones
  class ApplicationController < ActionController::Base
    before_filter :verify_user

    private
      def verify_user
        if ENV['USER_PASSWORD'] && ENV['USER_PASSWORD'] != 'admin_user'
          flash[:error] = 'Not authorised'
          redirect_to "/"  
        end
      end
  end
end
