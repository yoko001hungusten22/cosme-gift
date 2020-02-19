Rails.application.routes.draw do
  root 'main#index'
  get  '/index/:year/:event',    to: 'main#index'
  get  '/gift',    to: 'main#gift'
  get  '/gift_rank',   to: 'main#gift_rank'
end
