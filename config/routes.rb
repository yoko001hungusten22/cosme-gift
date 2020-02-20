Rails.application.routes.draw do
  root 'main#index'
  get '/gift/new/:event_name', to: 'main#gift_new', as: :gift_new_event
  get '/gift/rank', to: 'main#gift_rank'
  get '/gift/recommend', to: 'main#gift_recommend'
  
  get '/index/:event_name', to: 'main#index', as: :index_event
end