Rails.application.routes.draw do
  root to: 'app/front#index'
  get '/about', to: 'app/front#about', as: :app_about
  get '/services/civil', to: 'app/front#civil', as: :app_civil
  get '/services/electricity', to: 'app/front#electricidad', as: :app_electricity
  get '/services/metalmechanics', to: 'app/front#metalmecanica', as: :app_metalmechanics
  get '/services/tank', to: 'app/front#tank', as: :app_tank
  get '/projects/details', to: 'app/front#projectdetails', as: :app_projectdetails
  get '/projects/all', to: 'app/front#projects', as: :app_projects

  post 'admin/works/state', as: 'admin_work_state' 






  get "app/front/:type_project_id", to: "app/front#type_project", as: :app_front_type_project
 

  devise_for :users, skip: KepplerConfiguration.skip_module_devise

  namespace :admin do
    resources :works do
      get '(page/:page)', action: :index, on: :collection, as: ''
      get '/clone', action: 'clone'
      delete(
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
      )
    end


    resources :customizes do
      get '(page/:page)', action: :index, on: :collection, as: ''
      get '/clone', action: 'clone'
      post '/install_default', action: 'install_default'
      delete(
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
      )
    end

    root to: 'admin#root'

    resources :users do
      get '(page/:page)', action: :index, on: :collection, as: ''
      delete(
        '/destroy_multiple',
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
      )
    end

    resources :meta_tags do
      get '(page/:page)', action: :index, on: :collection, as: ''
      delete(
        '/destroy_multiple',
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
      )
    end

    resources :google_adwords do
      get '(page/:page)', action: :index, on: :collection, as: ''
      delete(
        '/destroy_multiple',
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
      )
    end

    resources :google_analytics_tracks do
      get '(page/:page)', action: :index, on: :collection, as: ''
      delete(
        '/destroy_multiple',
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
      )
    end

    resources :settings, only: [] do
      collection do
        get '/:config', to: 'settings#edit', as: ''
        put '/:config', to: 'settings#update', as: 'update'
        put '/:config/appearance_default', to: 'settings#appearance_default', as: 'appearance_default'
      end
    end
  end

  #keppler contact
  mount KepplerContactUs::Engine, :at => '/', as: 'messages'

  # Errors routes
  match '/403', to: 'errors#not_authorized', via: :all, as: :not_authorized
  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  # Dashboard route engine
  mount KepplerGaDashboard::Engine, at: 'admin/dashboard', as: 'dashboard'
end
