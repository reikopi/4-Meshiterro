class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

# 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    # 以下"[モデル名].[カラム名]"として、保存するカラムの中身を操作することができる
    # current_user はdeviceをインストールすることで使用可能。ヘルパーメソッドの一種。コードに記述するだけで、ログイン中のユーザーの情報を取得できる
    @post_image.user_id = current_user.id
    if @post_image.save
       redirect_to post_images_path
    else
       render :new
    end
  end

  def index
    # @post_images = PostImage.allを制限するため
    @post_images = PostImage.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new

  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end



end
