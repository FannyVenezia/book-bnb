class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @books = Book.all
    if params[:query].present?
      @books = @books.where("title ILIKE ?", "%#{params[:query]}%")
    end

    @markers = @books.geocoded.map do |book|
      {
        lat: book.latitude,
        lng: book.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {book: book}),
        image_url: helpers.asset_url("logo.png")
      }
    end
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to book_path(@book), notice: "Your book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    @book.destroy
    redirect_to books_path, status: :see_other
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :published, :editor, :description, photos: [])
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
