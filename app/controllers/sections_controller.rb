class SectionsController < ApplicationController

  before_action :set_book
  before_action :set_section, only: %i(show edit update destroy)

  def index
    @sections = @book.sections
  end

  def new
    @section = @book.sections.new
  end

  def create
    @section = @book.sections.new(section_params)

    if @section.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @section.update(section_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @section.destroy
    redirect_to action: :index
  end

  private
  def section_params
    params.require(:section).permit(:name, :content)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_section
    @section = @book.sections.find(params[:id])
  end
end


