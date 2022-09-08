Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      post '/managers', to: 'managers#create'
    end
  end 

end
