Rails.application.routes.draw do

  # namespace :admin do
  #   get 'members/genres'
  #   get 'members/items'
  #   get 'members/orders'
  #   get 'members/ordered_items'
  #   get 'members/homes'
  # end

  # devise_for :admins
  # devise_for :members

  # namespace :admin do
  #   resources :members,:genres, except:[:show, :new, :destroy]
  #   resources :items, except:[:destroy]
  #   resources :orders, except:[:destroy, :edit]
  #   resources :ordered_items, only:[:update]
  #   root 'homes#top'
  # end

  # namespace :public do
  #   resource :member, except:[:create, :new, :destroy]
  #   resources :delivery_destinations, except:[:show, :new]
  #   resources :items, except:[:destroy]
  #   resources :cart_items, except:[:show, :new, :edit]
  #   resources :orders, except:[:edit, :update, :destroy]
  #   root 'home#top'
  #   get 'homes/about' => 'homes#about'
  #   get 'orders/thanks' => 'orders#thanks'
  #   get 'orders/check' => 'orders#check'
  #   get 'members/leave' => 'members#leave'
  #   patch 'members/actived' => 'members#actived'
  #   put 'members/actived' => 'members#actived'
  # end

  # scope module: :public do
  #       resource :member, except:[:create, :new, :destroy]
  #       delete 'cart_items/all_destroy' => 'cart_items#all_destroy'
  # end
  devise_for :admins
  
  namespace :admin do
    resources :members,except:[:new, :create, :destroy]
    resources :genres, except:[:new, :show, :destroy]
    resources :items, except:[:destroy]
    resources :orders, except:[:new, :create, :edit, :destroy]
    resources :ordered_items, only:[:update]
    root 'homes#top'
  end

  devise_for :members, :members => {
    :sessions => 'members/sessions',
    :registrations => 'members/registrations',
    :passwords => 'members/passwords'
  }

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about'
    resource :member, except:[:create, :new, :destroy] do
      collection do
        get 'leave'
        put 'actived'
        patch 'actived'
      end 
    end
    resources :delivery_destinations, except:[:show, :new]
    resources :items, except:[:destroy]
    resources :cart_items, except:[:show, :new, :edit] do
      collection do
        delete '/' => 'cart_items#all_destroy'
      end
    end
    resources :orders, except:[:edit, :update, :destroy] do
      collection do
        get 'check'
        get 'thanks'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
