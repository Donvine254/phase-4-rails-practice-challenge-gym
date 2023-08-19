class GymsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
  def index
    render json: Gym.all, status: :ok
  end

  def show
    gym = find_gym
    render json: gym, status: :ok
  end

  def create
    gym = Gym.create!(gym_params)
    render json: gym, status: :created 
  end
  def update 
    gym=find_gym
    gym.update!(gym_params)
    render json: gym, status: :accepted
  end
  def destroy 
    gym=find_gym
    gym.destroy!
    render json: {message: 'Gym deleted successfully'}, status: :no_content
  end

  private

  def render_not_found_response
    render json: { Error: 'Gym not found' }, status: :not_found
  end

  def render_invalid_response(invalid)
    render json: { Errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def find_gym
    gym = Gym.find(params[:id])
  end

  def gym_params
    params.permit(:name, :address)
  end
end
