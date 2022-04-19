class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'に全角文字を使用してください' }
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'に全角文字を使用してください' }
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'に全角カナを使用してください' }
         validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'に全角カナを使用してください' }
         validates :birth_day, presence: true
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'
         
end
