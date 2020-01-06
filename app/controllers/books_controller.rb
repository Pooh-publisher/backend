class BooksController < ApplicationController

  before_action :set_book, only: %i(edit update show destroy)

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def index
    @page = params[:page]

    @total_page = (Book.count*1.0/10).ceil

    if !@page || @page.to_i < 1
      @page = 1
    elsif @page.to_i > @total_page
      @page = @total_page
    else
      @page = @page.to_i
    end

    @books = Book.offset((@page-1)*10).limit(10).order(:id)
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @book.destroy
    redirect_to action: :index
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :expected_completion_date, :category, :genre)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
