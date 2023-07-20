class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.book = @book
    @review.save
    redirect_to book_path(@book)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to books_path, status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :book_id)
  end
end
