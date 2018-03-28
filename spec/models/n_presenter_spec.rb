require 'rails_helper'

describe NPresenter do

  describe "instance methods" do

    subject { NPresenter.new(80231) }

    describe "#sorted_stations" do
      it "should return stations sorted by distance" do
        stations = subject.sorted_stations

        expect(station.first).to be()
      end
    end
  end
end
