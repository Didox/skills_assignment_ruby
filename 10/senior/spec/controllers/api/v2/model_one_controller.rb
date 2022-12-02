# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      token = encode_token(user_id: @user.id)
      render json: { user: @user, token: }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end
end
