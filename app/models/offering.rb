class Offering < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :class_signups

  def available?
    size > class_signups.count && scheduled_on >= Time.now
  end
end
