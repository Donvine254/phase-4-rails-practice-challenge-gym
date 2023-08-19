class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
  def index
    render json: Membership.all, status: :ok
  end

  def show
    membership = find_membership
    render json: membership, status: :ok
  end

  def create
    membership = Membership.create!(membership_params)
    render json: membership, status: :ok
  end
 

  private

  def render_not_found_response
    render json: { Error: 'Membership not found' }, status: :not_found
  end

  def render_invalid_response(invalid)
    render json: { Errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def find_membership
    membership = Membership.find(params[:id])
  end

  def membership_params
    params.permit(:gym_id, :client_id, :charge)
  end
  
end
