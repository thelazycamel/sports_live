module SportsLive
  class Outcome < Base

    property :id
    property :description
    property :price_decimal
    property :price
    property :price_id
    property :print_order
    property :opponent_id
    property :deduction
    property :sp
    property :nr
    property :market

    def self.find(outcome_id)
      events = SportsLive.list["sports"].collect{|sport| sport["events"]}.flatten
      outcome = events.collect {|event| event["outcomes"]}.flatten.select{|outcome| outcome["id"] == outcome_id}.first
      Outcome.new(outcome)
    end

  end
end
