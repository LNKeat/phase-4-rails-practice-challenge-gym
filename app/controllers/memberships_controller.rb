class MembershipsController < ApplicationController
    #CRUD: create only (membership must have a unique client)
    #Complete
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index 
        render json: Membership.all
    end

    def create
        membership = Membership.create(membership_params)
        if membership.valid?
            render json: membership
        else
            render json: { errors: membership.errors }, status: :unprocessable_entity
        end
    end

private
    def find_instance
        Membership.find(params[:id])
    end

    def membership_params
        params.permit(:charge, :gym_id, :client_id)
    end

    def render_unprocessable_entity_response
        render json: { errors: membership.errors }, status: :unprocessable_entity
      end
end
