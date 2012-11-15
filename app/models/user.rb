class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :image, :admin
  # attr_accessible :title, :body
  validates :name, :presence => true, :uniqueness => true

  def self.from_omniauth(auth)
     where(auth.slice(:provider, :uid)).first_or_create do |user|
     user.provider = auth.provider
     user.uid = auth.uid
     user.name = auth.info.nickname
     user.email = auth.info.email
     user.image = auth.info.image
     end
  end

  def self.new_with_session(params, session)
   if session["devise.user_attributes"]
     new(session["devise.user_attributes"], without_protection: true) do |user|
       user.attributes = params
       user.valid?
     end
   else
     super
   end
  end

  def password_required?
    super && provider.blank?
  end

end
