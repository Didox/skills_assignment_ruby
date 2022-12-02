# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :full_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :password_digest, length: { maximum: 255 }

  def self.authenticate(token)
    user_id = JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256').first['user_id']
    User.find_by(id: user_id)
  end
end
