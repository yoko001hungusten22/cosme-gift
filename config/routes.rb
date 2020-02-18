Rails.application.routes.draw do
  root 'main#index'
  get  '/index/:year/:event',    to: 'main#index'
  get  '/gift',    to: 'main#gift'
end
