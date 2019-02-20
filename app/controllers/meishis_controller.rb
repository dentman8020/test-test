class MeishisController < ApplicationController
  def index
    @meishis = Meishi.all
  end

  def show
    @meishi = Meishi.find(params[:id]) #hash値からURLを付ける
    @url = params[:url]
    if @meishi.url!=@url then 
      #実際は、その名刺へのアクセス権限がありません。的な静的ページを作る！forbidden.htmlなど
      redirect_to  "public/forbidden", status: 301
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
    @meishi = Meishi.new(meishi_params)
    @meishi.save
    
    @meishi.url = Digest::MD5.hexdigest(@meishi.name*@meishi.id) #make_hashは実際にはないので良い感じに修正してください。
    @meishi.update(meishi_params)
    redirect_to  meishis_url, status: 301
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
