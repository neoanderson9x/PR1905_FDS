class FavoritesController < ApplicationController
  def update
    favorite = Favorite.where(document: Documents.find(params[:document]), user:current_user)
    if favorite == []
      Favorite.create(document: Documents.find(params[:document]), user: current_user)
      @favorite_exitsts = true
    else
      favorite.destroy_all
      @favorite_exitst = false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end
