class UsersController < ApplicationController
  def create
    user = User.create(
      username: params[:username],
      name: params[:name],
      password: params[:password],
      email: params[:email],
      password_confirmation: params[:password_confirmation],
    )

    if user.save
      render json: { message: "User created sucessfully." }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end
