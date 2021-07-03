class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  protect_from_forgery with: :null_session 
    def twitter
        @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
    
        if @user.persisted?
            sign_in_and_redirect @user
        else
            session["devise.user_attributes"] = @user.attributes
            redirect_to new_user_registration_url
        end
    end
    def google
        @user = User.find_for_google(request.env['omniauth.auth'])
    
        if @user.persisted?
          flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
          sign_in_and_redirect @user, event: :authentication
          session[:user_id] = @user.id #add
        else
          session['devise.google_data'] = request.env['omniauth.auth']
          redirect_to new_user_registration_url
        end
      end
end
