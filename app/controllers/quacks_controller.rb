class QuacksController < ApplicationController
  def index
    @quacks = Quack.all
  end
  def new
    @quack = Quack.new
  end
  def create
    @quack = Quack.new(quack_params)
    @quack.user = current_user
    if @quack.save
      flash[:notice] = "Quack successful!"
      redirect_to quacks_path
    else
      flash[:alert] = "Failure. Please retry."
      redirect :back
    end
  end


# PRIVATE PRIVATE PRIVATE PRIVATE PRIVATE PRIVATE PRIVATE PRIVATE PRIVATE
private
  def quack_params
    params.require(:quack).permit(:body)
  end
end
