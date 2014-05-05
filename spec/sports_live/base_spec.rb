require_relative "../spec_helper.rb"

describe SportsLive::Base do

  it "#call should make a http get call to the required url" do
   expect(SportsLive::Base.new.call).to eq 1
  end

  it "#log should log the requests and exeptions" do
    pending
  end

  it "#cache should cache the call for 5 mins" do
    pending
  end
end
