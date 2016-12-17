class PlacesController < ApplicationController

  before_action :authenticate_user!, only: [:new]
  before_action :correct_user, only: [:edit, :update, :destroy] 

  def index
    @places = Place.page(params[:page]).per(15)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      flash[:success] = "You added a new place"
      redirect_to @place
    else
      flash[:danger] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @place = Place.find(params[:id])
    @picture = Picture.new
    @review = Review.new
    @pictures = @place.pictures 
    @reviews = @place.reviews.reverse
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      flash[:success] = "You added a new place"
      redirect_to @place
    else
      flash[:danger] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    @place = Place.destroy(params[:id])
    redirect_to root_path
  end

  def save_picture
    @picture = Picture.new(picture_params)
    @picture.save
    flash[:success] = "You added a new picture"
    redirect_to :back
  end

  def save_review
    @review = Review.new(review_params)
    @review.save
    flash[:success] = "You added a new review"
    redirect_to :back
  end

  private

  def place_params
    params.require(:place).permit(:title, :description, :image, :category_id, :user_id)
  end

  def review_params
    params.require(:review).permit(:body, :place_id, :user_id, :grade_food, :grade_service, :grade_interior)
  end


  def picture_params
    params.require(:picture).permit(:title, :image, :user_id, :place_id)
  end

  def correct_user
    @place = Place.find(params[:id])
    redirect_to(root_path) unless current_user == @place.user
  end
end
