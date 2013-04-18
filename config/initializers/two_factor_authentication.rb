module TwoFactorAuthentication
  module Controllers
    module Helpers
      private

      def handle_two_factor_authentication
        if not request.format.nil? and request.format.html? and not devise_controller?
          Devise.mappings.keys.flatten.any? do |scope|
            if signed_in?(scope) and warden.session(scope)[:need_two_factor_authentication] and !_process_action_callbacks.any?{|c| c.filter == "skip_two_factor_authentication".to_sym}
              session["#{scope}_return_tor"] = request.path if request.get?
              redirect_to two_factor_authentication_path_for(scope)
              return
            end
          end
        end
      end
    end
  end
end

Warden::Manager.after_authentication do |user, auth, options|
  if user.respond_to?(:need_two_factor_authentication?)
    if auth.session(options[:scope])[:need_two_factor_authentication] = user.need_two_factor_authentication?(auth.request)
      code = user.generate_two_factor_code
      user.second_factor_pass_code = code
      user.save
      user.send_two_factor_authentication_code(code)
    end
  end
end
