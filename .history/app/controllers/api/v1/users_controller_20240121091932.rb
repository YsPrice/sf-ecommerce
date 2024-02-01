module Api
  module V1
    class UsersController < ApiController
      before_action :set_user, only: [:show, :destroy]

      def index
        @users = User.all
        render json: @users.map { |user| user.as_json(include: :cart) }
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        render json: @user.as_json(include: :cart)
      end

      def destroy
        @user.destroy
        head :no_content
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
