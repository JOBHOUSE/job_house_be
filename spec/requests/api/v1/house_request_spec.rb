require 'rails_helper'

RSpec.describe 'house request' do
  it "sends a list of jobs for a given state and city" do
    VCR.use_cassette("houses") do
      job = Job.create!(salary_min: 1, salary_max: 1000000, location: "Houston, TX", company: "Texas Tech", contact: "Brad Chad", api_job_id: 1111, title: "Tech Bro")

      get "/api/v1/jobs/#{job.id}/houses"

      expect(response).to be_successful

      houses = JSON.parse(response.body, symbolize_names: true)
      expect(houses).to be_a(Hash)
      expect(houses).to have_key(:data)
      expect(houses[:data]).to be_an(Array)

      houses[:data].each do |house_info|
        expect(house_info).to have_key(:type)
        expect(house_info[:type]).to eq("job_house")

        expect(house_info).to have_key(:attributes)
        expect(house_info[:attributes]).to be_a(Hash)

        expect(house_info[:attributes]).to have_key(:id)
        expect(house_info[:attributes][:id]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:list_price)
        expect(house_info[:attributes][:list_price]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:address)
        expect(house_info[:attributes][:address]).to be_an(String)

        expect(house_info[:attributes]).to have_key(:contact)
        expect(house_info[:attributes][:contact]).to be_an(String)

        expect(house_info[:attributes]).to have_key(:bedrooms)
        expect(house_info[:attributes][:bedrooms]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:half_baths)
        expect(house_info[:attributes][:half_baths]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:full_baths)
        expect(house_info[:attributes][:full_baths]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:view)
        expect(house_info[:attributes][:view]).to be_an(String)

        expect(house_info[:attributes]).to have_key(:year_built)
        expect(house_info[:attributes][:year_built]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:photos)
        expect(house_info[:attributes][:photos]).to be_an(Array)
      end
    end
  end
end