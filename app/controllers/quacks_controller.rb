class QuacksController < ApplicationController
  def index
    @quacks = Quack.all
  end
end
