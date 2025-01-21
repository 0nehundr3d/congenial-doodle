class Carnival 
    attr_reader :duration, :rides

    def initialize(duration)
        @duration = duration
        @rides = []
    end

    def add_ride(ride)
        @rides << ride
    end

    def most_popular_ride
        @rides.max_by { |ride| ride.total_riders }
    end

    def most_profitable_ride
        @rides.max_by { |ride| ride.total_revenue }
    end

    def total_revenue
        @rides.sum { |ride| ride.total_revenue }
    end

    def unique_riders
        ride_visitors = {}

        unique_riders = []

        @rides.each { |ride| ride_visitors[ride] = ride.visitors }

        ride_visitors.each do |ride, visitors|
            visitors.each do |visitor|
                unique_riders << visitor if !unique_riders.include?(visitor)
            end
        end

        unique_riders
    end

    def get_visitor_info(visitor)
        
    end

    def summary
        summary_hash = {}
        riders = unique_riders

        
        summary_hash[:visitor_count] = riders.count
        summary_hash[:revenue_earned] = total_revenue
    end
end