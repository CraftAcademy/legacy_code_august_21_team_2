RSpec.describe "POST /api/images", type: :request do

  # before do
  #   stub_request(:post,
  #                "https://safe-for-work-api.herokuapp.com/api/analyses").with(body: "/fixtures/image_response.json")
  # end

  subject { response }

  describe "when the image api is used" do
    it "is expected to have a category of image" do
      expect(response_json["category"]).to eq "image"
    end
  end

  # describe 'when there are no images in the database' do
  #   it { is_expected.to have_http_status 200 }

  #   it 'is expected to respond with a message' do
  #     expect(response_json['message']).to eq 'There are no images'
  #   end
  # end
end
