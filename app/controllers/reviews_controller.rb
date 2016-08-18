class ReviewsController < ApplicationController

  def create
    @product = Product.find params[:product_id]
    @review = Review.new params.require(:review).permit([:body, :star_count])
    @review.product = @product
    if @review.save
      redirect_to product_path(@product), notice: "Review Listed"
    else
      # flash[:alert] = "Error"
      redirect_to product_path(@product), alert: "Error"
      # render "/products/show"
    end
  end

  def destroy
    @product = Product.find params[:product_id]
    @review = Review.find params[:id]

    @review.destroy
    redirect_to product_path(@product), notice: "Review Deleted"
  end
end
