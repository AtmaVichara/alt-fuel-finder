require 'rails_helper'

describe "as a user" do
  context "from the root path" do
    describe "when I fill in search form and click locate" do
      it "shows list of the 10 closest stations within 6 miles sorted by distance" do
        VCR.use_cassette("features/search", :record => :new_episodes) do
          visit root_path

          fill_in "q", with: 80203
          click_on "Locate"

          expect(current_path).to eq("/search")
          expect(page).to have_css(".station", count: 10)
          expect(page).to have_css(".station-name", count: 10)
          expect(page).to have_css(".station-address", count: 10)
          expect(page).to have_css(".station-fuel-type", count: 10)
          expect(page).to have_css(".station-distance", count: 10)
          expect(page).to have_css(".station-access-times", count: 10)
          expect(page).to_not have_content("E85")
        end
      end
    end
  end
end
