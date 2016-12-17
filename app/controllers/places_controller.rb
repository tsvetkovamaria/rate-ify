class PlacesController < ApplicationController

  before_action :authenticate_user!, only: [:new]
  before_action :correct_user, only: [:edit, :update, :destroy] 

  def index
    @places = Place.all
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

  private

  def place_params
    params.require(:place).permit(:title, :description, :image, :agreement, :category_id, :user_id)
  end

  def correct_user
    @place = Place.find(params[:id])
    redirect_to(root_path) unless current_user == @place.user
  end
end
