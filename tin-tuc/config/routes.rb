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
  scope '/' do
  	get "/:category/:slug",to: "fontend#detail",as: "fontend_detail"
  end
  root "fontend#index"
end
