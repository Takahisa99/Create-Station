class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :creates

  #いいね機能
  has_many :favorites, dependent: :destroy
  validates_uniqueness_of :create_id, scope: :user_id


end
