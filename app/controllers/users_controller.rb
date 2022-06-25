class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # 特定のユーザ（@user）に関連付けられた投稿全て（.post_images）を取得し、@post_imagesに渡す
    # 全体の投稿ではなく、個人が投稿したもの全てを表示できる
    # @post_images = @user.post_images に制限をかける
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  redirect_to user_path(@user.id)
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  
  
end
