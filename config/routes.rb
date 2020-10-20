Rails.application.routes.draw do

  devise_for :admins
  namespace :admin do
    resources :members,except:[:new, :create, :destroy]
    resources :genres, except:[:new, :show, :destroy]
    resources :items, except:[:destroy]
    resources :orders, except:[:new, :create, :edit, :destroy]
    resources :ordered_items, only:[:update]
    root 'homes#top'
  end
<<<<<<< HEAD

  scope module: :public do
    resource :member, except:[:create, :new, :destroy]
    resources :delivery_destinations, except:[:show, :new]
    resources :items, except:[:destroy]
    resources :cart_items, except:[:show, :new, :edit]
    resources :orders, except:[:edit, :update, :destroy]
    root 'homes#top'
    get 'homes/about' => 'homes#about'
    get 'orders/thanks' => 'orders#thanks'
    get 'orders/check' => 'orders#check'
    get 'members/leave' => 'members#leave'
    patch 'members/actived' => 'members#actived'
    put 'members/actived' => 'members#actived'
=======
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
>>>>>>> c5c6de1406e6b632c65477b1f9ca9655df8b8fa5
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
