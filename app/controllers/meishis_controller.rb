class MeishisController < ApplicationController
  def index
    if(user_signed_in?)
      sql="SELECT * FROM meishis WHERE created_user==" << current_user.id.to_s
      @meishis = Meishi.find_by_sql(sql)
    else
      redirect_to  "/forbidden", status: 301
    end
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
    if @meishi.created_user!=current_user.id then 
      redirect_to  "/forbidden", status: 301
    end
  end

  def destroy
    @meishi = Meishi.find(params[:id])
    @meishi.destroy
    redirect_to meishis_path
  end
  
  def create
    @meishi = Meishi.new(meishi_params)
    @meishi.save
    @meishi.url = Digest::MD5.hexdigest(@meishi.name*@meishi.id)
    @meishi.update(meishi_params)
    @meishi.created_user=current_user.id
    @meishi.update(meishi_params)
    redirect_to  "/meishis/#{@meishi.id}/#{@meishi.url}/"
  end

  def update
    @meishi = Meishi.find(params[:id])
    if @meishi.created_user!=current_user.id then 
      redirect_to  "/forbidden", status: 301
    else
      @meishi.update(meishi_params)
      redirect_to  meishi_url, status: 301
    end
  end

  def release

  end
  private
  def meishi_params
    params.require(:meishi).permit(:name, :intro, :line, :insta, :twitter, :facebook) 
  end
end  
