class User < ApplicationRecord
  has_many :entries
  has_many :comments
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  USER_PARAMS = [:name].freeze
end
