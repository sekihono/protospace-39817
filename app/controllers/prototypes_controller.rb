class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :authenticate_user, only: [:edit]

  def index
    #binding.pry
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    #binding.pry
    @prototype = Prototype.find(params[:id])
    #binding.pry
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    #binding.pry
  end

  def edit
    unless user_signed_in?
      redirect_to action: :index
    end
    #binding.pry
    @prototype = Prototype.find(params[:id])
    #binding.pry
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
     redirect_to prototype_path(@prototype)
    else
      render :edit, status: :unprocessable_entity
    end
    #binding.pry
  end  

  def destroy
    #binding.pry
    @prototype = Prototype.find(params[:id])
    #binding.pry
    @prototype.destroy
    redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def authenticate_user
    @prototype = Prototype.find(params[:id])
    unless current_user == @prototype.user
      redirect_to action: :index
    end
  end

end
