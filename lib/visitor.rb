class Visitor
    attr_reader :name, :height, :preferences, :spending_money

    def initialize(name, height, spending_money)
        @name = name
        @height = height
        @spending_money = spending_money[1..-1].to_i
        @preferences = []
    end

    def add_preference(preference)
        @preferences << preference
        @preferences
    end

    def tall_enough?(height)
        @height >= height
    end

    def pay_admission(ammount)
        return false if ammount > spending_money

        @spending_money -= ammount
        true
    end

    def has_preference?(preference)
        @preferences.include?(preference)
    end
end