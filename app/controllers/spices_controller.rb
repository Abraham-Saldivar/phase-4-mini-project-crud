class SpicesController < ApplicationController
    def index 
        spices = Spice.all 
        render json: spices 
    end
    def create
        new_spice = Spice.create(spice_params)
        render json: new_spice , status: :created
    end
    def update
        update_spice = Spice.find_by(id: params[:id])
        update_spice.update(spice_params)
        render json: update_spice , status: :accepted
    end

    def destroy
        find_spice = Spice.find_by(id: params[:id])
        find_spice.destroy
        head :no_content
    end
end





private 


    def spice_params
        params.permit(:title , :image , :description , :notes , :rating)
    end
