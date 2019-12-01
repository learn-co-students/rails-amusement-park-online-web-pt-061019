class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  # validates :password, presence: true
  # validates :email, confirmation: true
  def mood
    # if self.happiness > self.nausea
    #   "happy"
    # else
    #   "sad"
    # end
    (self.happiness > self.nausea) ? "happy" : "sad"
  end
end
