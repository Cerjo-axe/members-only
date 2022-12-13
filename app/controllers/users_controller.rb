class UsersController < ApplicationController
    def new
        @user=User.new
    end
    def create
        @user=User.new(user_params)
        if @user.save
            session[:user_id]=@user.id
            redirect_to root_url, notice: "Signed Up"
        else
            flash.now[:error] = "Email or password invalid!!!"
            render :new, status: :unprocessable_entity
        end
    end


    private
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end
end
