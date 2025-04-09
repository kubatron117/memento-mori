class ApplicationController < ActionController::API

  private

  def authenticate
    rodauth.require_account
  end

  # def authenticate
  #   rodauth.check_active_session
  #   rodauth.require_account
  # end

  def current_account
    rodauth.rails_account
  end
end
