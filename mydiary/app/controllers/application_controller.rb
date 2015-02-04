class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :count_requests_in_session

  def count_requests_in_session
    session[:requests] ||= 0
    session[:requests] += 1
  end
end
