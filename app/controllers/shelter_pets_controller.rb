class ShelterPetsController < ApplicationController
  def index
    @shelter = Shelter.find(params[:shelter_id])
    @pets = @shelter.pets.all
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.new(pet_params)

    if pet.save
      redirect_to "/shelters/#{shelter.id}/pets"
    else
      render :new
    end
  end
end

private

def pet_params
  params.permit(:name, :image, :desciption, :age, :sex, :status)
end
