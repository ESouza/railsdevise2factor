Rails3DeviseRspecCucumber::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

  resources :users, :only => [:two_factor_code]  do
    collection do
      get :two_factor_code
    end
  end

  match '/send_code', to: 'user_ajax/code_confirmation#send_code'
end
