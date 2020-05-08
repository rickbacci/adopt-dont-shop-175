class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    shelter = Shelter.new(shelter_params)

    if shelter.save
      redirect_to '/shelters'
    else
      render :new
    end
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    @shelter = Shelter.find(params[:id])

    if @shelter.update(shelter_params)
      redirect_to "/shelters/#{@shelter.id}"
    else
      render :edit
    end
  end

  private

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
