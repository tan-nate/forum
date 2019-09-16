class PlacesController < ApplicationController
    before_action :require_login, only: [:follow]
    
    def index
        @places = Place.all
    end

    def show
        @place = Place.find(params[:id])
    end

    def follow
        @place = Place.find(params[:id])
        current_user.places << @place
        redirect_to place_path(@place)
    end

    def unfollow
        @place = Place.find(params[:id])
        current_user.places.delete(@place)
        redirect_to places_path
    end
end
