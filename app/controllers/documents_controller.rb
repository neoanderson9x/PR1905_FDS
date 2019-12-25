class DocumentsController < ActionController::Base
  def index
    @documents = Document.all
  end
end
