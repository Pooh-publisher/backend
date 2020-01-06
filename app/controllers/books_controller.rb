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
    @books = Book.all.order(:id)
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
