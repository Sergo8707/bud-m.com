require 'rails_helper'

# Тест на шаблон users/index.html.erb

RSpec.describe 'users/index', type: :view do
  # Перед каждым шагом мы пропишем в переменную @users пару пользователей
  # как бы имитируя действие контроллера, который эти данные будет брать из базы
  # Обратите внимание, что мы объекты в базу не кладем, т.к. пишем FactoryGirl.build_stubbed
  before(:each) do
    assign(:users, [
      FactoryGirl.build_stubbed(:user, name: 'Вадик', balance: 5000),
      FactoryGirl.build_stubbed(:user, name: 'Миша', balance: 3000),
    ])

    render
  end

  # Проверяем, что шаблон выводит имена игроков
  it 'renders player names' do
    expect(rendered).to match 'Вадик'
    expect(rendered).to match 'Миша'
  end

  # Проверяем, что шаблон выводит балансы игроков
  it 'renders player balances' do
    expect(rendered).to match '5 000 ₽'
    expect(rendered).to match '3 000 ₽'
  end

  # Проверяем, что шаблон выводит игроков в нужном порядке
  # (вообще говоря, тест избыточный, т.к. за порядок объектов в @users отвечает контроллер,
  # но чтобы показать, как тестировать порядок элементов на странице, полезно)
  it 'renders player names in right order' do
    expect(rendered).to match /Вадик.*Миша/m
  end
end
