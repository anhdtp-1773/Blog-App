class User < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]

  scope :by_lastest, ->{order created_at: :desc}

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      password = Devise.friendly_token[0,20]
      user = User.create(name: data["name"],
        email: data["email"],
        password: password,
        password_confirmation: password,
        confirmation_token: "8c80bbac5c4df6e9a85af6940ba1c3f3",
        confirmed_at: Time.now,
        confirmation_sent_at: Time.now
      )
    end
    user
  end
end
