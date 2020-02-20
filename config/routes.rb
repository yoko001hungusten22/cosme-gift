Rails.application.routes.draw do
  root 'main#index'
  get  '/gift/new',        to: 'main#gift_new'
  get  '/gift/rank',       to: 'main#gift_rank'
  get  '/gift/recommend',  to: 'main#gift_recommend'
  
  get  '/index/:event_name',  to: 'main#index', as: :index_event
end