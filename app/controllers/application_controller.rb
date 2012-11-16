class ApplicationController < ActionController::Base
  protect_from_forgery
  layout "forms", :only => [:new, :edit]
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

  def latest_video
    Video.published.recent.first
  end

  helper_method :latest_video
end
