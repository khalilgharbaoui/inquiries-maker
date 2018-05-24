Rails.application.routes.draw do

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    root to: "moving_inquiries#new"
    devise_for :users, controllers: {
          sessions: 'users/sessions',
          registrations: "users/registrations"
        }
    post "moving_inquiries/new", to: "moving_inquiries#create", as: 'create_moving_inquiry'
    # post "cleaning_inquiries/new", to: "cleaning_inquiries#create", as: 'create_cleaning_inquiry'
    # post "combined_inquiries/new", to: "combined_inquiries#create", as: 'create_combined_inquiry'
    resources :moving_inquiries, except: [:create]
    # resources :cleaning_inquiries, except: [:create]
    # resources :combined_inquiries, except: [:create]
  end
  get "*path", to: redirect("/#{I18n.locale}/%{path}", status: 302), constraints: {path: /(?!(#{I18n.available_locales.join("|")})\/).*/}, format: false
  get '*locale/*action/*path', to: redirect("/#{I18n.locale}/%{action}/%{path}", status: 302), constraints: {path: /(?!(#{I18n.available_locales.join("|")})\/).*/}, format: false
  get '/*locale/*action/*path', to: redirect("/#{I18n.locale}/%{action}/%{path}", status: 302), constraints: {path: /(?!(#{I18n.available_locales.join("|")})\/).*/}, format: false

end
