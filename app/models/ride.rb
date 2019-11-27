class Ride < ApplicationRecord
    belongs_to :attraction
    belongs_to :user

    def not_tall_enough?
        self.user.height < self.attraction.min_height
    end

    def not_enough_tickets?
        self.user.tickets < self.attraction.ticket_number
    end

    def take_ride
        if not_tall_enough? && not_enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif not_enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif not_tall_enough? 
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else 
            start_ride
        end
    end
    
    def start_ride
        self.user.update(tickets: self.user.tickets - self.attraction.ticket_number, nausea: self.user.nausea + self.attraction.nausea_rating, happiness: self.user.happiness + self.attraction.happiness_rating)
        "Thanks for riding the #{self.attraction.name}!"
    end
end
