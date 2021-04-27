require "rails_helper"

RSpec.describe Types::QueryType do
  describe "items" do
    let!(:items) { create_pair(:item) }

    let(:query) do
      %(query{
        items {
          description
        }
      })
    end

    subject(:result) do
      MartianLibrarySchema.execute(query).as_json
    end
    
    it "returns all items" do
      expect(result.dig("data", "items")).to match_array(
        items.map { |item| { "description" => item.description } }
      )
    end
  end

  describe "users" do
    let!(:users) { create_pair(:user) }

    let(:query) do
      %(query{
        users {
          email
        }
      })
    end

    subject(:result) do
      MartianLibrarySchema.execute(query).as_json
    end
    
    it "returns all users" do
      expect(result.dig("data", "users")).to match_array(
        users.map { |user| { "email" => user.email } }
      )
    end
  end
end
