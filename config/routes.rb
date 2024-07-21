Rails.application.routes.draw do
  post "/users", to: "users#create"
  post "me", to: "users#me"
  post "/auth/login", to: "auth#login"
end
