module SportsLive
  class Event < Base

    property :id
    property :is_virtual
    property :outcomes, :transformer => lambda {|outcomes| outcomes.collect{|outcome| SportsLive::Outcome.new(outcome) } }
    property :event_id
    property :title
    property :market_id
    property :status_id
    property :score
    property :description
    property :start_time
    property :meeting
    property :meeting_id
    property :media
    property :american_format
    property :event_type
    property :pos
    property :status
    property :status_type
    property :total_outcomes


    def sport
      sports.select {|spt| spt if spt.events.collect(&:id).include?(id)}.first
    end

    def self.find(event_id)
      events = SportsLive.list["sports"].collect{|sport| sport["events"]}.flatten
      event = events.select{|event| event["id"] == event_id}.first
      Event.new(event)
    end

  end
end
