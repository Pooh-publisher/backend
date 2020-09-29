class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

end
