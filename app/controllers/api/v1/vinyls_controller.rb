class Api::V1::VinylsController < ApplicationController

    def index
        @vinyls = Vinyl.all
        render json: @vinyls
    end

    def create
        vinyls = Vinyl.new(vinyl_params)
    end

    private

    def vinyl_params
        params.require(vinyl).permit(:title, :artist, :image_url, :genre_id)
    end
end
