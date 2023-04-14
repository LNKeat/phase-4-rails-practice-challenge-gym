class GymsController < ApplicationController
    #CRUD: index, show, destroy (destroy all memberships), update- Bonus
    #Completed
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        gyms = Gym.all
        render json: gyms
    end

    def show
        gym = find_instance
        render json: gym
    end

    def destroy 
        gym = find_instance
        gym.destroy
        render json: { message: "Gym & memberships deleted" }
    end

    def update 
        gym = find_instance
        gym.update(gym_params)
        render json: gym
    end


private
    def find_instance
        gym = Gym.find(params[:id])
    end

    def gym_params 
        params.permit(:name, :address)
    end

    def render_not_found_response
        render json: { error: "Gym not found" }, status: :not_found
    end
end
