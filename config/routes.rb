Rails.application.routes.draw do

  devise_for :students, controllers: {
    registrations: 'students/registrations',
  }
  resources :students, only: [:show]
  devise_for :groups, controllers: {
    registrations: 'groups/registrations',
  }
  resources :groups, only: [:show]

  resources :start, only: [:index]
  resources :chats, except: :show
  resources :talks, except: :show do 
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:index, :create]
  end
  resources :questions, except: [:show, :destroy]
  resources :user_display, only: [:index]
  resources :group_display, only: [:index]
  resources :ranking, only: [:index]
  resources :tests, except: [:edit, :update] do
    member do
      get 'answer'
    end
    resources :problems, only: [:index]
  end
  root "start#index"

end
