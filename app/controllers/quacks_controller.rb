class QuacksController < ApplicationController
  def index
    @quacks = Quack.all.order('created_at DESC')
  end
  def new
    @quack = Quack.new
  end
  def create
    @quack = Quack.new(quack_params)
    @quack.user = current_user
    if @quack.save
      respond_to do |format|
        format.html { redirect_to quacks_path }
        format.js
      end
      flash[:notice] = "Quack successful!"
    else
      flash[:alert] = "Failure. Please retry."
    end
  end


# PRIVATE PRIVATE PRIVATE PRIVATE PRIVATE PRIVATE PRIVATE PRIVATE PRIVATE
private
  def quack_params
    params.require(:quack).permit(:body)
  end
end
