class SharedCell < Cell::Rails
  include Devise::Controllers::Helpers
  helper_method :current_user, :user_signed_in?

  def navbar
    render
  end

end
