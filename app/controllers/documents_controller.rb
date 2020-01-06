class DocumentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :new]
  def index
    @documents = Document.all
  end

  def show
    @document = Document.includes(comments: :user).find(params[:id])
    @favorite_exists = Favorite.where(document: @document, user: current_user) == [] ? false : true
  end

  def new
    @document = current_user.documents.build
  end

  def create
    @document = current_user.documents.build(document_params)
    if @document.save
      flash[:success]= "Successfully uploaded."
      redirect_to documents_path
    else
      flash.now[:danger] = "Upload failed"
      render "new"
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    flash[:success]= "Document deleted"
    redirect_to documents_path
  end
private
  def document_params
    params.require(:document).permit(:name, :attachment, :description)
  end
end
