class ApplicationsController < ApplicationController
  def new
  end

  def create
    application = Application.new(application_params)

    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:alert] = "Error: #{error_message(application.errors)}"
      render :new
    end
  end

  def show
    @application = Application.find(params[:id])
    if params[:search]
      @pets = @application.search_pets(params[:search])
    end
  end

  def update
    application = Application.find(params[:id])

    if params[:pet_id]
      pet = Pet.find(params[:pet_id])
    end
    if pet
      application.pets << pet
    end

    application.update(application_params)
    redirect_to "/applications/#{application.id}"
  end

  private
    def application_params
      params.permit(:id, :name, :address, :city, :state, :zip,
                    :description, :status, :search)
    end
end
