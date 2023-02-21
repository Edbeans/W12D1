class Api::PokemonController < ApplicationController

    def types
        render json: [
            'fire',
            'electric',
            'normal',
            'ghost',
            'psychic',
            'water',
            'bug',
            'dragon',
            'grass',
            'fighting',
            'ice',
            'flying',
            'poison',
            'ground',
            'rock',
            'steel'
            ]
    end

    def index
        @pokemons = Pokemon.all 
        render json: @pokemons 
    end
    
    def create
        @pokemon = Pokemon.new(pokemon_params)
        if @pokemon.save 
            render json: @pokemon
        else
            render @pokemon.error.full_messages, status: 404 
        end
            
    end
    
    def show
        @pokemon = Pokemon.find_by(id: params[:id])
        render json: @pokemon 
    end

    def update
    end


    
    
    private
    def pokemon_params 
        params.require(:pokemon).permit(:number, :name, :attack, :defense, :poke_type, :image_url, :captured);
    end    
end
