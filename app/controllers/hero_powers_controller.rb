class HeroPowersController < ApplicationController
    def create
        hero_power = HeroPower.create(heroPower_params)
        if hero_power.valid?
            hero_power.save
            hero = hero_power.hero 
            render json: hero.as_json(include: :powers)
        else 
            render json: { errors: hero_power.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private 

    def heroPower_params
        params.permit(:hero_id, :power_id, :strength)
    end

end
