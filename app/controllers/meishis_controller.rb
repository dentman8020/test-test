class MeishisController < ApplicationController
  def index
    @meishis = Meishi.all
  end

  def show
    @meishi = Meishi.find(params[:id])
  end

  def new
    @meishi = Meishi.new
  end

  def edit
  end
  
  def create
    @meishi = Meishi.new(meishi_params)
    @meishi.save
    redirect_to  meishis_url, status: 301
  end

  private
  def meishi_params
    params.require(:meishi).permit(:name, :intro, :line, :insta, :twitter, :facebook) 
  end
end  
