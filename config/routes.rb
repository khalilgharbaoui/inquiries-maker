Rails.application.routes.draw do
  resources :combined_inquiries
  resources :cleaning_inquiries
  scope "(:locale)", locale: /en|de|fr/ do
    root to: "moving_inquiries#index"
  end
  resources :moving_inquiries
end
