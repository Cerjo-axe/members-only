class SessionsController < ApplicationController
    def new
    end

    def create
        user=User.find_by_email(params[:email])
        if user && compare(user)
            session[:user_id]=user.id
            redirect_to root_url, notice:"Logged in!"
        else
            flash.now[:error] = "Email or password invalid!!!"
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        session.delete(:user_id)
        session[:user_id]= nil
        redirect_to root_url, notice:"Logged out!!!"
    end

    private

    def compare(obj)
        converted_pass=BCrypt::Engine.hash_secret(params[:password],obj[:crypt})
        ActiveSupport::SecurityUtils.secure_compare(obj[:h_password],converted_pass)
    end
end
