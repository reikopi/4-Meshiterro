Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/edit'
  root to: "homes#top"
  devise_for :users
  get 'homes/about' => 'homes#about', as:'about'
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  # を書き直し
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  # コメントは投稿に対して、むすびつくので親子関係に[ネストするの状態]
  # そうしてparams[:post_image_id]でPostImageのidが取得できるようになる
   resources :post_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
