require_relative "../spec_helper"

describe "Calling the API" do

  before :each do
    stubbed_json = File.new(File.join(File.expand_path(File.dirname(__FILE__)), "../fixtures/sports.json"))
    stub_request(:get, "#{BASE_URL}live/en/live/list.json?").to_return(:status => 200, :body => stubbed_json)
  end

  it "#SportsLive.list should return the entire list as a hash" do
    expect(SportsLive.list.version).to eq("978874660003_39aacc4b4_en_2_1")
  end

  context "it should return objects" do

    subject(:response) {SportsLive.list}

    it "#sports should return an array of SportsList::Sport objects" do
      expect(response.sports.first).to be_kind_of(SportsLive::Sport)
    end

    it "#events should return an array of SportsList::Event objects" do
      expect(response.events.first).to be_kind_of(SportsLive::Event)
    end

    it "#outcomes should return an array of SportsList::Outcome objects" do
      expect(response.outcomes.first).to be_kind_of(SportsLive::Outcome)
    end

    it "#find_sport(sport_id) should return the requested sport" do
      sport = response.find_sport(400)
      expect(sport.title).to eq("Golf")
    end

    it "#find_event(event_id) should return the requested event" do
      event = response.find_event(182783010)
      expect(event.title).to eq("Ksenia Palkina v Anastasia Rudakova")
    end

    it "#find_outcome(outcome_id) should return the requested outcome" do
      outcome = response.find_outcome(16785151000)
      expect(outcome.description).to eq("Lina Gjorcheska")
      expect(outcome.price).to eq("1/9")
      expect(outcome.price_decimal).to eq(1.1111111111111112)
    end

  end

end
