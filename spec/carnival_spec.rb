require 'simplecov'
SimpleCov.start

require './lib/carnival'
require './lib/ride'
require './lib/visitor'

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
        @visitor2 = Visitor.new('Tucker', 36, '$5')
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
end