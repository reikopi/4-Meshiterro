class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # 特定のユーザ（@user）に関連付けられた投稿全て（.post_images）を取得し、@post_imagesに渡す
    # 全体の投稿ではなく、個人が投稿したもの全てを表示できる
    @post_images = @user.post_images
  end

  def edit
  end
end
