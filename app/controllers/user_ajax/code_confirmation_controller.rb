class UserAjax::CodeConfirmationController < ActionController::Base

  before_filter :skip_two_factor_authentication, only: :two_factor_code

  def send_code
    render text: 'hello'
  end

  private
    def skip_two_factor_authentication

    end
end
