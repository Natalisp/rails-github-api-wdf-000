class ApplicationController < ActionController::Base
  before_action :authenticate_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def authenticate_user
      client_id = ENV['GITHUB_ID']
      github_url = "https://github.com/login/oauth/authorize?scope=repo&client_id=#{client_id}"
      redirect_to github_url unless logged_in?
    end

    def logged_in?
      !!session[:token]
    end
end
