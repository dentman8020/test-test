class MeishisController < ApplicationController
  def index
    @meishis = Meishi.all
  end

  def show
    @meishi = Meishi.find(params[:id]) #hash値からURLを付ける
  end

  def new
    @meishi = Meishi.new
  end

  def edit
    @meishi = Meishi.find(params[:id])
  end

  def destroy
    @meishi = Meishi.find(params[:id])
    @meishi.destroy
    redirect_to meishis_path
  end
  
  def create
    @meishi = Meishi.new(meishi_params)
    @meishi.save
    @meishi.url = make_hash(@meishi.create_at) #make_hashは実際にはないので良い感じに修正してください。
    @meishi.update(meishi_params)
    redirect_to  meishis_url, status: 301
  end

  def update
    @meishi = Meishi.find(params[:id])
    @meishi.update(meishi_params)
    redirect_to  meishi_url, status: 301
  end

  private
  def meishi_params
    params.require(:meishi).permit(:name, :intro, :line, :insta, :twitter, :facebook) 
  end
end  
