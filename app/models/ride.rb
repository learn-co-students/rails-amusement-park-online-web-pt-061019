class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  validates :user_id, presence: true
  validates :attraction_id, presence: true

  def take_ride
    user = User.find_by_id(self.user_id)
    attraction = Attraction.find_by_id(self.attraction_id)

    if user.tickets >= attraction.tickets
      if user.height >= attraction.min_height
        attraction.rides << self
        attraction.users << user

        user.tickets = user.tickets - attraction.tickets
        user.nausea = user.nausea + attraction.nausea_rating
        user.happiness = user.happiness + attraction.happiness_rating
        user.save

        "Thanks for riding the #{attraction.name}!"
      else
        "Sorry. You are not tall enough to ride the #{attraction.name}."
      end
    else
      if user.height >= attraction.min_height
        "Sorry. You do not have enough tickets to ride the #{attraction.name}."
      else
        "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      end
    end
  end
end
