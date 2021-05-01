class ApplicationController < ActionController::Base
  before_action :check_for_user_session

  def check_for_user_session
    session[:user_identifier] = generate_user_identifier unless session[:user_identifier].present?
    puts session[:user_identifier]
  end

  def generate_user_identifier
    [*("a".."z"), *("0".."9")].sample(35).join
  end
end
