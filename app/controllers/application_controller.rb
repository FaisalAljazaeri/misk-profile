class ApplicationController < ActionController::Base
    # Define extra feilds permitted for the devise sign_up form
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :img])
        end
end
