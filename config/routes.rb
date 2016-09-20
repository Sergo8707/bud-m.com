Rails.application.routes.draw do
  root 'users#index'

  # Путь для админки
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Пути для формы регистрации, входа и т.д.
  devise_for :users

  # в профиле юзера показываем его игры, на главной - список лучших игроков
  resources :users, only: [:index, :show]

  resources :games, only: [:create, :show] do
    # доп. методы ресурса:
    put 'help', on: :member # помощь зала
    put 'answer', on: :member # ответ на текущий вопрос
    put 'take_money', on: :member #  игрок берет деньги
  end

  # Ресурс в единственном числе - ВопросЫ
  # для загрузки админом сразу пачки вопросОВ
  resource :questions, only: [:new, :create]
end
