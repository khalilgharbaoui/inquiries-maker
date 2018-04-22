Rails.application.routes.draw do
  resources :combined_inquiries
  resources :cleaning_inquiries
  root to: "moving_inquiries#index"
  resources :moving_inquiries
end
