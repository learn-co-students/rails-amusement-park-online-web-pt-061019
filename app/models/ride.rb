class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user 

  def take_ride 
    if missing_tickets && too_short 
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif missing_tickets 
      ticket_message
    elsif too_short 
      height_message
    else 
      enjoy_ride
    end 
  end 

  def missing_tickets 
    self.user.tickets < self.attraction.tickets 
  end 

  def ticket_message
    "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  end 

  def too_short 
    self.user.height < self.attraction.min_height 
  end 

  def height_message 
    "Sorry. You are not tall enough to ride the #{attraction.name}."
  end 

  def enjoy_ride 
    user.tickets = user.tickets - attraction.tickets
    user.happiness = user.happiness + attraction.happiness_rating 
    user.nausea = user.nausea + attraction.nausea_rating 
    user.save
    "Thanks for riding the #{attraction.name}!"
  end 
  
end