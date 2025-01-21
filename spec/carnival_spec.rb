require 'simplecov'
SimpleCov.start

require './lib/carnival'
require './lib/ride'
require './lib/visitor'
require 'pry'

describe Carnival do
    before :each do
        @carnival = Carnival.new(14)

        @ride1 = Ride.new({
            name: 'Carousel',
            min_height: 24,
            admission_fee: 1,
            excitement: :gentle
        })
        @ride2 = Ride.new({
            name: 'Roller Coaster',
            min_height: 54,
            admission_fee: 2,
            excitement:
            :thrilling
        })

        @carnival.add_ride(@ride1)
        @carnival.add_ride(@ride2)

        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 54, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')

        @visitor1.add_preference(:gentle)

        @visitor2.add_preference(:gentle)
        @visitor2.add_preference(:thrilling)

        @visitor3.add_preference(:thrilling)

        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)

        @ride2.board_rider(@visitor2)
        @ride2.board_rider(@visitor3)
    end

    describe '#initialize' do
        it 'exists' do
            expect(@carnival).to be_a(Carnival)
            expect(@carnival.duration).to eq(14)

            expect(Carnival.new(14).rides).to eq([])
        end
    end

    describe '#add_ride' do
        it 'can add rides' do
            expect(@carnival.rides).to eq([@ride1, @ride2])
        end
    end

    describe '#most_popular_ride' do
        it 'can return the most popular ride' do
            expect(@carnival.most_popular_ride).to eq(@ride1)
        end
    end

    describe '#most_profitable_ride' do
        it 'can return the most profitable ride' do
            expect(@carnival.most_profitable_ride).to eq(@ride2)
        end
    end

    describe '#total_revenue' do
        it 'can return the total revenue of the carnival' do
            expect(@carnival.total_revenue).to eq(7)
        end
    end

    describe '#unique_riders' do
        it 'can return an array of unique riders' do
            expect(@carnival.unique_riders).to eq([@visitor1, @visitor2, @visitor3])
        end
    end

    describe '#summary' do
        xit 'can return a summary of the carnival' do
            expect(@carnival.summary).to eq({
                visitor_count: 3,
                revenue_earned: 7,
                visitors: [
                    {
                        visitor: @visitor1,
                        favorite_ride: @ride1,
                        total_money_spent: 2
                    },
                    {
                        visitor: @visitor2,
                        favorite_ride: @ride1,
                        total_money_spent: 3
                    },
                    {
                        visitor: @visitor3,
                        favorite_ride: @ride2,
                        total_money_spent: 2
                    }
                ],
                rides: [
                    {
                        ride: @ride1,
                        riders: [@visitor1, @visitor2],
                        total_revenue: 3
                    },
                    {
                        ride: @ride2,
                        riders: [@visitor2, @visitor3],
                        total_revenue: 4
                    }
                ]
            })
        end
    end
end