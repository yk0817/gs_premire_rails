Rails.application.routes.draw do
  get "sessions/new"
  # user登録画面
  get "users/new"
  post "users/create"
  # login
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  # 記事登録画面
  get "posts/index"
  get "posts/new"
  get "posts/edit"
  post "posts/create"
  get "posts/:id", to: "posts#show"

end
