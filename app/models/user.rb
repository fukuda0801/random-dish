class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 },
            format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英数字で入力してください' }
  validates :sex, presence: true
end
