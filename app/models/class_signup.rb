class ClassSignup < ActiveRecord::Base
  belongs_to :offering
  belongs_to :user
end
