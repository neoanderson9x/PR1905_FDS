class ApplicationController < ActionController::Base
  def favorite_text
    return @favorite_exists ? "Unfavorite" : "Favorite"
  end
  helper_method :favorite_text
end
