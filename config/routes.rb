DIY::Application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  root to: "static#home"
end
