class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, :through => :user_books

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    name = auth_hash[:info][:name]
    image_url = auth_hash[:info][:image]
    mail = auth_hash[:info][:email]

    User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.name = name
      user.image_url = image_url
      user.mail = mail
    end
  end
end
