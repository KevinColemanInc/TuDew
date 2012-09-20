class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    if user_signed_in?
      @categories = Category.find_all_by_user_id(current_user.id)
    end 
  end
	
end
