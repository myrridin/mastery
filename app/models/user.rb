class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :offerings
  has_many :class_signups
  has_many :student_offerings, source: :offering, through: :class_signups

  def to_s
    name
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end

  def signed_up_for
    student_offerings.where('offerings.scheduled_at > ?', Time.now)
  end

  def signed_up_for? offering
    ClassSignup.where(user_id: id, offering_id: offering.id).count > 0
  end

  def sign_up_for(offering)
    unless signed_up_for? offering
      ClassSignup.create(user_id: id, offering: offering)
      offering.update_attribute(:signed_up, offering.students.count)
    end
  end

  def drop_offering(offering)
    if signed_up_for? offering
      ClassSignup.find_by(user_id: id, offering: offering).destroy
      offering.update_attribute(:signed_up, offering.students.count)
    end
  end

  def is_admin?
    admin_flag
  end

  def is_instructor?
    instructor_flag
  end

  def self.instructors
    where(instructor_flag: true)
  end
end
