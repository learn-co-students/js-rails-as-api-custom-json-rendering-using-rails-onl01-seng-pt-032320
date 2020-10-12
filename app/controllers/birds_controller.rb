class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds
  end

  def show 
    bird = Bird.find_by(id: params[:id])
    if bird 
    render json: {id: bird.id, name: bird.name, species: bird.species}
    else 
      render json: { message: 'Bird not found'}
    # render json: bird.slice(:id, :name, :species)
    # slice won't work for an array of hashes like the 
    # one we have in our index action:
    # render json: birds, only: [:id, :name, :species]
    # render json: birds, except: [:created_at, :updated_at]
    end
  end 
end