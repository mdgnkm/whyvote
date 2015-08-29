class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :members
  has_many :teams, through: :members

  def full_name
    return (self.first_name + " " + self.last_name)
  end

  def self.from_omniauth(auth)
    logger.debug "### FACEBOOK INFO : #{auth.info.pretty_print_inspect} ###"
    logger.debug "### FACEBOOK AUTH : #{auth.pretty_print_inspect} ###"
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
