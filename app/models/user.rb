# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :timeoutable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  def as_json(options={})
    super({ only: %i[id email first_name second_name phone] })
  end

  # Set other keys in payload, you can also append them in blacklist redis key
  # def jwt_payload
  #    { 'foo' => 'bar' }
  # end
  #
  # # The following method will be called on dispatching a jwt auth, You can set rules to revork jwt here
  # def on_jwt_dispatch(token, payload)
  #     # $redis.setex("user_blacklist:#{self.id}:#{jti}", expiration, jti)
  # end
end
