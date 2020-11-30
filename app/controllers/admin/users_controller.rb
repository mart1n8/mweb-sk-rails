class Admin::UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]
    access [:admin] =>  [:all]

    def index
        @users = User.order(username: :asc).paginate(page: params[:page], per_page: 20)
    end


    def edit
    end

    def update
    @user.roles = params[:user][:roles]
    respond_to do |format|
      if @user.save
        flash[:notice] = "Užívateľ bol upravený."
        format.html { redirect_to admin_edit_user_path(@user) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
