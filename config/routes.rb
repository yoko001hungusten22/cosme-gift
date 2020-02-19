Rails.application.routes.draw do
  root 'main#index'
  get  '/gift/new',        to: 'main#gift_new'
  get  '/gift/rank',       to: 'main#gift_rank'
  get  '/gift/recommend',  to: 'main#gift_recommend'
  
  get  '/gift/:year/:event',  to: 'main#gift_event', as: :gift_event
  get  '/gift/:year/:month',  to: 'main#gift_month', as: :gift_month
end