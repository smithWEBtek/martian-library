require "rails_helper"

RSpec.describe Mutations::SignInMutation do
  describe "sign_in" do
    let!(:user) { create(:user) }

    let(:mutation) do
      %(mutation {
        signIn(email: "user-1@example.com") {
          token
        }
      })
    end
    
    subject(:result) do
      MartianLibrarySchema.execute(mutation).as_json
    end
    
    it "returns auth token, by finding user in DB via email" do
      expect(!result["data"]["signIn"]["token"].nil?).to eq(true)
    end
  end
end