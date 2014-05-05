module SportsLive
  class List
   
    attr_reader :to_hash

    include APISmith::Client
    base_uri BASE_URL
    endpoint "live/en/live"

    def call
      get("/list.json")
    end

    def to_hash
      JSON.parse(call)
    end

  end
end
