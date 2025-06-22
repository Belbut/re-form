class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      puts user_params
      flash.now[:error] = @user.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  #  get "/users/:id/edit", to: "users#edit"
  def edit
    @user = User.find(params[:id])
  end

  #  put "/users/:id", to: "users#update"
  def update
    @user = User.find(params[:id])
    puts "changing from #{User.find(params[:id]).inspect} to ->>>> #{params}"

    if @user.update(user_params)
      redirect_to edit_user_path
    else
      flash.now[:error] = @user.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.expect(user: %i[username email password])
  end
end
