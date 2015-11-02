Tones::Engine.routes.draw do
  resources :tones do
    collection do
      get :sign_in
      post :sign_in
      delete :sign_out
    end
  end
end
