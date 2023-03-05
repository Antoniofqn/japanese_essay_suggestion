Rails.application.routes.draw do
  root 'home#index'
  post 'generate' => 'home#generate'
end
