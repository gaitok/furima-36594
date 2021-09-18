class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数のみを両方含む必要があります' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）の必要があります' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）の必要があります' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）のみの必要があります' }
    validates :last_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）のみの必要があります' }
    validates :birthday
  end
end
