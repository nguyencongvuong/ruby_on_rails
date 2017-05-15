Rails.application.routes.draw do
 
 
  
  	get 'admin/new',to: "admin#show"
  	get 'admin/',to: "admin#index"


end
