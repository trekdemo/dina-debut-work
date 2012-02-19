Numerals::Application.routes.draw do
  root to: 'conversion#index'
  post '/', to: 'conversion#index'
end
