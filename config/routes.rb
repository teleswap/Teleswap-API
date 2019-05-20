Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do


    resources :users do
      resources :listings
    end

    resources :listings do
      resources :acceptable_offers
    end

    resources :acceptable_offers do
      resources :counter_offers
    end

    resources :tokens, only: [:create]
    resources :images, only: [:create]
  end
end
