class ApplicationController < ActionController::Base
  # before_action :banned?

  def banned?
    if current_user.present? && current_user.banned?
      sign_out current_user
      flash[:error] = "This account has been suspended"
      root_path
    end
  end
end
