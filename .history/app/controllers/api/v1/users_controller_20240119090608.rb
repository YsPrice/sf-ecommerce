module Api
  module V1
    class UsersController < ApiController
      before_action :set_user, only: [:show, :destroy]

      def index
        @users = User.all
        render json: @users
      end

      def create
        @user = User.new(user_params)
  
        if @user.save
          @cart = Cart.create(user: @user)
          render json: {user:@user, cart:@cart}, status: :created
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
        render json: user.as_json(include: :cart)
      end

      def user_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
