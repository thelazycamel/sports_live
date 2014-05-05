module SportsLive
  class Base < APISmith::Smash

    attr_reader :find_sport, :find_event, :find_outcome, :events, :outcomes

    property :version
    property :sports, :transformer => lambda {|sports| sports.collect{|sport| SportsLive::Sport.new(sport) }}

    def find_sport(sport_id)
      sports.select{|sport| sport.id == sport_id}.first
    end

    def find_event(event_id)
      events.select{|event| event.id == event_id}.first
    end

    def find_outcome(outcome_id)
      outcomes.select{|outcome| outcome.id == outcome_id}.first
    end

    def events
      sports.collect{|sport| sport.events}.flatten
    end

    def outcomes
      events.collect{|event| event.outcomes}.flatten
    end

  end
end
