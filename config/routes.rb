
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :crews
  get 'api_html/portal'
  get 'api_html/dashboard'
  get 'api_html/techschedule'
  get 'api_html/makecall'
  resources :notes do
    collection do
      match 'api', to: 'notes#api', via: [:get, :post], defaults: { format: :json }
    end
  end






  namespace :api, defaults: { format: :json } do
    resources :sessions, only: [:create]
    resources :service_manager, only: [:create, :destroy] # Modify this line as needed
    post 'service_manager/auto_schedule', to: 'service_manager#auto_schedule'  # adding api at the begining seems to break
    post 'service_manager/make_appointment', to: 'service_manager#make_appointment'
    get 'service_manager/view_open', to: 'service_manager#view_open'
    get 'service_manager/view_sync', to: 'service_manager#view_sync'
    get 'service_manager/view_all', to: 'service_manager#view_all'
    get 'service_manager/view_by_tech', to: 'service_manager#view_by_tech'
    get 'service_manager/modal', to: 'service_manager#modal'
    get 'service_manager/get_day', to: 'service_manager#get_day'
    post 'service_manager/inner_notes', to: 'service_manager#inner_notes'
    put 'service_manager/sync_complete', to: 'service_manager#sync_complete'
    put 'service_manager/sync_kick_back', to: 'service_manager#sync_kick_back'
    put 'service_manager/sync_kick_back', to: 'service_manager#sync_kick_back'
    get 'service_manager/close_call', to: 'service_manager#close_call'
    get 'service_manager/rescheduleCallAvailableSlots', to: 'service_manager#rescheduleCallAvailableSlots'
    get 'service_manager/view_not_scheduled', to: 'service_manager#view_not_scheduled'

  end
  get 'Appointment_Portal', to: 'api_html#portal'






  get 'schedules/available_slots', to: 'schedules#available_slots'
  get 'schedules/days_by_proximity', to: 'schedules#days_by_proximity'

  resources :days do
    collection do
      match 'api', to: 'days#api', via: [:get, :post, :put, :patch, :delete], defaults: { format: :json }
    end
  end
  resources :samsungcalls do
    collection do
      match 'api', to: 'samsungcalls#api', via: [:get, :post, :put, :patch, :delete], defaults: { format: :json }
    end
  end
 

  resources :twilio_actions, only: [:index, :create] do
    collection do
      post 'make_call'
      post 'send_text'
      post 'disconnect_call'
    end
  end

  post 'start_conference_call', to: 'twilio_actions#start_conference_call'
  post 'initiate_call_and_join_conference', to: 'twilio_actions#initiate_call_and_join_conference'
  post 'join_conference', to: 'twilio_actions#join_conference'
  post 'disconnect_call', to: 'twilio_actions#disconnect_call'
  get 'schedules', to: 'schedules#index'
  resources :agents
  resources :technicians
  resources :payments do 
    resources :receipts
  end
  resources :orders do
    resources :payments
  end
  resources :customers do 
    resources :orders
  end
  resources :web_calls
  get 'twilio/voice'
  resources :calls
  resources :reps
  

  get 'helpful', to: 'pages#helpLink', as: :helpLink
  get 'pportal', to: 'pages#phonePortal', as: :phonePortal
  get 'Appliance Hospital', to: 'pages#hospital', as: :hospital
  get 'Extended Warranties', to: 'pages#warranties', as: :warranties
  get 'Appliance Parts', to: 'pages#parts', as: :parts
  get 'Appliance Repair Near Me', to: 'pages#nearme', as: :nearme
  get 'Helpful Articles', to: 'pages#article', as: :article
  get 'Best Appliance', to: 'pages#best', as: :best
  get 'Repair Cost', to: 'pages#cost', as: :cost
  get 'pages/aux'
  root 'pages#frontdoor'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
