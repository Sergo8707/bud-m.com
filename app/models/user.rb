#  (c) goodprogrammer.ru
#
# Юзер — он и в Африке юзер, только в Африке черный :)
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :validatable, :rememberable

  # имя не пустое, email валидирует Devise
  validates :name, presence: true

  # поле только булевское (лож/истина) - недопустимо nil
  validates :is_admin, inclusion: {in: [true, false]}, allow_nil: false

  # это поле должно быть только целым числом, значение nil - недопустимо
  validates :balance, numericality: {only_integer: true}, allow_nil: false

  # у юзера много игр, они удалятся из базы вместе с ним
  has_many :games, dependent: :destroy

  # расчет среднего выигрыша по всем играм юзера
  def average_prize
    (balance.to_f/games.count).round unless games.count.zero?
  end
end
