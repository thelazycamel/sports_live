module SportsLive
  class Sport < Base
    
    property :id
    property :title
    property :meetings
    property :is_virtual
    property :events, :transformer => lambda {|events| events.collect{|event| SportsLive::Event.new(event) } }
    property :pos

    def self.find(sport_id)
      Base.call["sports"].select{|sport| sport["id"] == 400}.first
      Sport.new(sport)
    end

  end
end
