require "net/http"
require "json"

module SportsLive

  def self.list 
    SportsLive::Base.new(SportsLive::List.new.to_hash)
  end
  
end
