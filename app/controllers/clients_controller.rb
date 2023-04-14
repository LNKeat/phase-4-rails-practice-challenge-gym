class ClientsController < ApplicationController
    #CRUD: show only--> Bonus: display sum of gym membership fees), index/update 
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        clients = Client.all
        render json: clients
    end

    def show 
        client = find_instance
        render json: client, serializer: ClientMembershipSumSerializer
    end


private

    def find_instance
        client = Client.find(params[:id])
    end


    def render_not_found_response
        render json: { error: "Client not found" }, status: :not_found
    end

end
