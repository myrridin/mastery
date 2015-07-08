class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :offerings
  has_many :class_signups
  has_many :student_offerings, source: :offering, through: :class_signups

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def signed_up_for
    student_offerings.where('offerings.scheduled_at > ?', Time.now)
  end

  def sign_up_for(offering)
    ClassSignup.where(user_id: id, offering_id: offering.id).first_or_create
    # TODO This isn't always necessary. This whole method should get a little more robust
    offering.update_attribute(:signed_up, offering.students.count)
  end
end
