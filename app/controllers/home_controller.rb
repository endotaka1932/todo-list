class HomeController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    def index
        redirect_to new_user_session_path
    end
end
