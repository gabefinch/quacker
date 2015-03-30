class Quack < ActiveRecord::Base
  belongs_to :user

private
  def quack_params
    require(:quack).permit(:body)
  end
end
