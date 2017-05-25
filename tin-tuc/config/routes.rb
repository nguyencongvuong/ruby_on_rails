Rails.application.routes.draw do
    mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace 'admin' do
    get "/",to: "new#index"
    scope "/news" do
  		get "/",to: "new#news",as: 'news'
  		get "/them-moi",to: "new#add",as: "themmoi"
      post "/create",to: "new#create"
      delete "/delete/:id",to: "new#delete",as:"delete"
      get "/edit/:id",to: "new#edit",as:"edit"
      put "/update/:id",to: "new#update",as: "update"
    end

    scope "category" do
      get "/",to: "category#index",as: "category"
      post "/save",to: "category#save",as: "category_save"
      delete "/delete/:id",to: "category#delete",as: "category_delete"
      get "/edit/:id",to:"category#edit",as: "category_edit"
      put "/update/:id",to:"category#update",as:"category_update"
    end
  end

  scope "/user" do
    get "/register",to: "user#register",as: "user_register"
    post "/create",to: "user#create",as: "user_create"
    get "/show",to: "user#show",as: "user_show"
    get '/active/:slug',to: "user#active",as: "user_active"
    post "/session/create",to: "session#create",as: "session_create"
    get "/login",to: "session#login",as:"session_login"
    get "/show/:id",to: "session#show",as: "user"
    get "/logout",to: "session#logout",as: "logout"
  end
  
  scope '/' do
    get "/search",to:"fontend#search",as: "fontend_search"
    get "/:category",to: "fontend#category",as: "fontend_category"
  	get "/:category/:slug",to: "fontend#detail",as: "fontend_detail"
    post "/comment/create",to:"fontend#comment",as: "fontend_comment"
  end

  root "fontend#index"
end
