Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/admin",to: "admin#index"
  namespace 'admin' do
  		get "/news",to: "new#news",as: 'news'
  		get "/news/them-moi",to: "new#add",as: "themmoi"
      post "/news/create",to: "new#create"
  end
  scope '/' do
  	root "fontend#index"
  end
end
