class MeishisController < ApplicationController
  def index
    @meishis = current_user.meishis
  end

  def show
    @meishi = Meishi.find(params[:id]) #hash値からURLを付ける
    
    @url = params[:url]
    if @meishi.url!=@url then 
      #実際は、その名刺へのアクセス権限がありません。的な静的ページを作る！forbidden.htmlなど
      redirect_to  "/forbidden", status: 301
    end
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
    @meishi = Meishi.new
    @meishi.user_id = current_user
    @meishi.save
    
    #@meishi.url = Digest::MD5.hexdigest(@meishi.name*@meishi.id)
    #@meishi.update(meishi_params)
    redirect_to  "/meishis/#{@meishi.id}/#{@meishi.url}/"
  end

  def update
    @meishi = Meishi.find(params[:id])
    @meishi.update(meishi_params)
    redirect_to  meishi_url, status: 301
  end

  def release

  end
  private
  def meishi_params
    params.require(:meishi).permit(:name, :intro, :line, :insta, :twitter, :facebook) 
  end
end  
