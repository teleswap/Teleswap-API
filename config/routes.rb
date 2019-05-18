Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do


    resources :users do
      resources :listings
    end

    resources :listings do
      resources :offers
    end

    resources :offers

    resources :tokens, only: [:create]
  end
end
