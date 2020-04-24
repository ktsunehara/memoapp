class UsersController < ApplicationController
    def show
        @users = User.where(user_id: current_user.id)
    end
end

