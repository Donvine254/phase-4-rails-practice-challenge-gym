class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  def index 
    render json: Client.all, status: :ok
  end
  
  def show
    client = find_client
    render json: client, serializer: ClientShowSerializer, status: :ok
  end

  def create
    client = Client.create!(client_params)
    render json: client, status: :created
  end
  def update 
    client = find_client
    client.update!(client_params)
    render json: client, status: :accepted
  end

  private

  def render_not_found_response
    render json: { Error: 'Client not found' }, status: :not_found
  end

  def render_invalid_response(invalid)
    render json: { Errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def find_client
    client = Client.find(params[:id])
  end

  def client_params
    params.permit(:name, :age)
  end
end
