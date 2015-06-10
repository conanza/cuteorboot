class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update, :destroy, :show]
  before_action :require_logout, only: [:new, :create]
  before_action :require_current_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @hobbies = Hobby.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = ["Welcome to Cute or Not!"]
      login(@user)
      redirect_to root_url
    else
      @hobbies = Hobby.all
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @hobbies = Hobby.all
    render json: @user
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)

    else
      @hobbies = Hobby.all
      render :edit
    end
  end

  def show
    @user = User.includes(:hobbies).find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to home_url
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :password,
      :gender,
      :birthdate,
      :city,
      :state,
      :animal_type,
      :breed,
      :website,
      :instagram,
      hobby_ids: []
    )
  end
end
