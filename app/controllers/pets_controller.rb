class PetsController < ApplicationController
  def index
    case params[:adoptable]
    when 'true'
      @pets = Pet.where(status: 'adoptable')
    when 'false'
      @pets = Pet.where(status: 'pending_adoption')
    else
      @pets = Pet.order(:status)
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])

    if @pet.update(pet_params)
      redirect_to "/pets/#{@pet.id}"
    else
      render :edit
    end
  end

  def destroy
    Pet.destroy(params[:id])

    redirect_to '/pets'
  end

  private

  def pet_params
    params.permit(:name, :image, :desciption, :age, :sex, :status)
  end
end
