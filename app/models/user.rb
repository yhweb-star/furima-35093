class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items

  with_options presence: true do
    validates :nickname
    validates :birth
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Full-width characters' } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶー]+\z/, message: 'Full-width katakana characters' } do
      validates :first_name_kana
      validates :last_name_kana
    end
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }
end