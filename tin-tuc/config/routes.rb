Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/admin' do
  		get "/",to: "admin#index",as: 'admin'
  		get "/news",to: "admin#news"
  		# root "admin#index"
  end
  scope '/' do
  	root "fontend#index"
  end
end
