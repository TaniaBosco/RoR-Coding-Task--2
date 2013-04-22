class User1 < ActiveRecord::Base
require Rails.root.join('lib', 'devise', 'Encryptors', 'md5')
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:encryptable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable,:token_authenticatable
PASSWORD_REGEX = /^[a-f0-9]{32}$/i
validates :password, :format => PASSWORD_REGEX

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
def password_salt
  'no salt'
end
def password_salt=(new_salt)
end
end
