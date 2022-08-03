class PlacesController < ApplicationController
  def index
    places = Places.all
    render json: places
  end

  def create
    place = Place.new(
      name: params["name"],
      address: params["address"],
    )
  end

  def show
    place = Place.find_by(id: params["id"])
    render json: place
  end

  def update
    place = Place.find_by(id: params["id"])
    place.name = params["name"] || place.name
    place.address = params["address"] || place.address
    if place.save
      render json: place
    else
      render json: { errors: place.errors.full_messages }, status: 418
    end
  end

  def delete
    place = Place.find_by(id: params["id"])
    place.delete
    render json: { message: "They were all just paper towns..." }
  end
end
