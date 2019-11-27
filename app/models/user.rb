class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password
    validates :name, presence: true
    validates :height, presence: true
    validates :happiness, presence: true
    validates :nausea, presence: true
    validates :tickets, presence: true
    validates :password, presence: true

    def mood
        if self.nausea > self.happiness
            "sad"
        elsif self.happiness > self.nausea 
            "happy"
        end
    end
end
