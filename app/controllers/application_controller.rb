class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

   def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :mechanic, :bike_info, :city, :location, :company_name, :insta_availability])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :mechanic, :bike_info, :city, :location, :company_name, :insta_availability])
  end

  def default_url_options
  { host: ENV["www.bikefix.site"] || "localhost:3000" }
  end

end