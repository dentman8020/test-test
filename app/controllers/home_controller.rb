class HomeController < ApplicationController
  def index    
    if(user_signed_in?)
      redirect_to "/meishis", status: 301
    end
  end
end
