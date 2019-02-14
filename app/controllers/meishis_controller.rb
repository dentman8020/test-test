class MeishisController < ApplicationController
  def index
  end

  def show
  end

  def new
    @meishi = Meishi.new
  end

  def edit
  end
  
  def create
    meishi = Meishi.new
    meishi.save!
    redirect_to meishis_url, #notice: "名刺名「#{meishi.name}」を登録しました"
  end
  private
  def meishi_params
    params.require(:task).permit(:name, :intro, :line, :insta, :twitter, :facebook)
  end
end
