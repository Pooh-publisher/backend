class SectionsController < ApplicationController
  def index
    book = Book.find(params[:book_id])
    @sections = book.sections
  end

  def new
    book = Book.find(params[:book_id])
    @section = book.sections.new
  end

  def create
    book = Book.find(params[:book_id])
    @section = book.sections.new(section_params)

    if @section.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private
  def section_params
    params.require(:section).permit(:name, :content)
  end
end

