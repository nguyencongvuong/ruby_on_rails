Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/admin",to: "admin#index"
  namespace 'admin' do
  		get "/news",to: "new#news",as: 'news'
  		get "/news/them-moi",to: "new#add",as: "themmoi"
      post "/news/create",to: "new#create"
    scope "category" do
      get "/",to: "category#index",as: "category"
      get "/create",to: "category#create",as: "category_create"
      post "/save",to: "category#save",as: "category_save"
    end
  end
  scope '/' do
  	root "fontend#index"
  end
end
