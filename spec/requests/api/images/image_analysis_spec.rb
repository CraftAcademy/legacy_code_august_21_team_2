RSpec.describe "POST https://safe-for-work-api.herokuapp.com/api/analyses", type: :request do
  subject { response }

  describe "when there are some image in the database" do
  end

  describe "when there are no image in the database" do
    it { is_expected.to have_http_status 200 }

    it "is expected to respond with a message" do
      expect(response_json["message"]).to eq "There are no images"
    end
  end
end
