class UsersController < ApplicationController
  before_action :set_user, only: [:show]
	

  def index
    @users = User.paginate(page: params[:page])
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
    @expenses = @user.expense.paginate(page: params[:page])
  end

   # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to homes_path, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end



  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :expense)
  end

  def authorize
      redirect_to login_url, notice: 'Please login.' unless correct_user
  end

  def correct_user
      if current_user_id
        current_user_id == @user.id
      else
        false
      end
  end
end
