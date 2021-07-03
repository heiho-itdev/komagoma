class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers:%i[twitter google_oauth2]


        def self.from_omniauth(auth)
          find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
            user.provider = auth["provider"]
            user.uid = auth["uid"]
            user.username = auth["info"]["nickname"]
          end
        end
      
        def self.new_with_session(params, session)
          if session["devise.user_attributes"]
            new(session["devise.user_attributes"]) do |user|
              user.attributes = params
            end
          else
            super
          end
        end

        protected
        def self.find_for_google(auth)
          user = User.find_by(email: auth.info.email)
      
          unless user
            user = User.create(name:     auth.info.name,
                               email: auth.info.email,
                               provider: auth.provider,
                               uid:      auth.uid,
                               token:    auth.credentials.token,
                               password: Devise.friendly_token[0, 20],
                               meta:     auth.to_yaml)
          end
          user 
        end
end
