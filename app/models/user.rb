class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true

  validates_format_of :last_name, :first_name, with: /\A[ぁ-んァ-ン一-龥]+\z/
  validates_format_of :last_name_kana, :first_name_kana, with: /\A[ァ-ヶー－]+\z/

end
