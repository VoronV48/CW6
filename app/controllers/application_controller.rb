class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
    ## this render call should be:
    # render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end
  
  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def access_denied(exception)
    flash[:danger] = exception.message
    redirect_to root_url
  end

end
