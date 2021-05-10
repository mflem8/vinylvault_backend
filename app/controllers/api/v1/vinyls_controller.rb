class Api::V1::VinylsController < ApplicationController

    def index
        vinyls = Vinyl.all
        render json: VinylSerializer.new(vinyls)
    end

    def show
        vinyl = Vinyl.find(params[:id])
        render json: VinylSerializer.new(vinyl)
    end

    def create
        vinyl = Vinyl.new(vinyl_params)
        if vinyl.save
            render json: VinylSerializer.new(vinyl), status: :accepted
        else
            render json: {errors: vinyl.errors.full_messages}, status: :unprocessible_entity
        end
    end

    private

    def vinyl_params
        params.require(:vinyl).permit(:title, :artist, :image_url, :genre_id)
    end
end
