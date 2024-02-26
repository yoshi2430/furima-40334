class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases
  has_one_attached :avatar
  
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true

  validates_format_of :last_name, :first_name, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates_format_of :last_name_kana, :first_name_kana, with: /\A[ァ-ヶー－]+\z/
  validates_format_of :password, with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i


end
