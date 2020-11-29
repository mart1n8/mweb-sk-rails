class Admin::UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]

    def index
        @users = User.order(username: :asc).paginate(page: params[:page], per_page: 20)
    end


    def edit
    end

    def update
        @user.roles = params[:user][:roles]
        @user.save
        respond_to do |format|
            flash[:notice] = "Užívateľ  bol vymazaný."
            format.html { redirect_to admin_edit_user_path(@user) }
            format.json { head :no_content }
        end
    end

    def destroy
        @user.destroy
        respond_to do |format|
          flash[:notice] = "Užívateľ  bol vymazaný."
          format.html { redirect_back(fallback_location: root_path) }
          format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:roles)
      end
end
