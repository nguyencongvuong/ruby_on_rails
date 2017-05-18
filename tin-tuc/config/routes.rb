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
      post "/save",to: "category#save",as: "category_save"
      delete "/delete/:id",to: "category#delete",as: "category_delete"
      get "/edit/:id",to:"category#edit",as: "category_edit"
      put "/update/:id",to:"category#update",as:"category_update"
    end
  end
  scope '/' do
  	root "fontend#index"
  end
end
