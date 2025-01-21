require 'simplecov'
SimpleCov.start

require './lib/visitor'

describe Visitor do
    before :each do
        @visitor1 = Visitor.new("Bruce", 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')
    end

    describe '#initialize' do
        xit 'exists' do
            expect(@visitor1).to be_a Visitor
            expect(@visitor1.name).to eq("Bruce")
            expect(@visitor1.height).to eq(54)
            expect(@visitor1.spending_money).to eq(10)
            expect(@visitor1.preferences).to eq([])
        end
    end

    describe '#preferences' do
        xit 'can add and list out preferences' do
            @visitor1.add_preference(:gentele)
            @visitor1.add_preference(:thrilling)

            expect(@visitor1.preferences).to eq([:gentele, :thrilling])
        end
    end

    describe '#tall_enough?' do
        xit 'can tell if a visitor is above a certain height' do
            expect(@visitor1.tall_enough?(54)).to eq(true)
            expect(@visitor2.tall_enough?(54)).to eq(false)
            expect(@visitor3.tall_enough?(54)).to eq(true)
            expect(@visitor1.tall_enough?(64)).to eq(false)
        end
    end
end