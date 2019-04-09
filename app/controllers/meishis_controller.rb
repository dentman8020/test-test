class MeishisController < ApplicationController
  def index
    if(user_signed_in?)
      sql="SELECT * FROM meishis WHERE created_user==" << current_user.id.to_s
      @meishis = Meishi.find_by_sql(sql)
    else
      redirect_to "/forbidden", status: 301
    end
  end
  

  def show
    @meishi = Meishi.find(params[:id]) #hash値からURLを付ける
    @url = params[:url]
    if @meishi.key!=@url then 
      #実際は、その名刺へのアクセス権限がありません。的な静的ページを作る！forbidden.htmlなど
      redirect_to "/forbidden", status: 301
    end
  end

  def new
    @meishi = Meishi.new
  end

  def edit
    @meishi = Meishi.find(params[:id])
    if @meishi.created_user!=current_user.id then 
      redirect_to "/forbidden", status: 301
    end
  end

  def destroy
    @meishi = Meishi.find(params[:id])
    if @meishi.created_user==current_user.id then 
      @meishi.destroy
    end
    redirect_to meishis_path
  end
  
  def create
    @meishi = Meishi.new(meishi_params)
    @meishi.save
    @meishi.key = Digest::MD5.hexdigest(@meishi.name*@meishi.id*current_user.id)
    @meishi.update(meishi_params)
    @meishi.created_user=current_user.id
    @meishi.update(meishi_params)
    redirect_to "/meishis/#{@meishi.id}/#{@meishi.key}/"
  end

  def update
    @meishi = Meishi.find(params[:id])
    if @meishi.created_user!=current_user.id then 
      redirect_to "/forbidden", status: 301
    else
      @meishi.update(meishi_params)
      redirect_to meishi_url, status: 301
    end
  end

  def release

  end
  
  private
  def meishi_params
    params.require(:meishi).permit(:name, :intro, :account1_info, :account2_info, :account3_info, :account4_info,   :intro2, :number, :facebook, :twitter, :insta, :line, :website1, :website2, :pixiv, :linkedln, :youtube, :address, :picture) 
  end
end  
