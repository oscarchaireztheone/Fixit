Rails.application.routes.draw do

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
