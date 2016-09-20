require 'rails_helper'

# Тест на фрагмент users/_game.html.erb, который выводит
# информацию о конкретной игре на странице профиля

RSpec.describe 'users/_game', type: :view do
  # Подготовим объект game для использования в тестах, где он понадобится
  # обратите внимание, что build_stubbed не создает объект в базе, будьте аккуратнее
  let(:game) do
    FactoryGirl.build_stubbed(
      :game, id: 15, created_at: Time.parse('2016.10.09, 13:00'), current_level: 10, prize: 1000
    )
  end

  # Этот код будет выполнен перед каждым it-ом
  before(:each) do
    # Разрешаем объекту game в ответ на вызов метода status возвращать символ :in_progress
    allow(game).to receive(:status).and_return(:in_progress)

    # Рендерим наш фрагмент с нужным объектом
    render partial: 'users/game', object: game
  end

  # Проверяем, что фрагмент выводит id игры
  it 'renders game id' do
    expect(rendered).to match '15'
  end

  # Проверяем, что фрагмент выводит время начала игры
  it 'renders game start time' do
    expect(rendered).to match '09 окт., 13:00'
  end

  # Проверяем, что фрагмент выводит текущий уровень
  it 'renders game current quesion' do
    expect(rendered).to match '10'
  end

  # Проверяем, что фрагмент выводит статус игры
  it 'renders game status' do
    expect(rendered).to match 'в процессе'
  end

  # Проверяем, что фрагмент выводит текущий выигрыш игрока
  it 'renders game prize' do
    expect(rendered).to match '1 000 ₽'
  end
end
