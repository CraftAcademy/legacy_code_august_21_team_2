RSpec.describe "GET /api/analyses", type: :request do
  subject { response }

  before do
    get "/api/analyses"
  end

  describe "when there are no images in the database" do
    it { is_expected.to have_http_status 200 }

    it "is expected to respond with a message" do
      expect(response_json["message"]).to eq "There are no images"
    end
  end
end


# RSpec.describe "POST /api/analyses", type: :request do

#   before do
#     stub_request(:post,
#                  "https://safe-for-work-api.herokuapp.com").to_return(status: 200)
#   end

#   subject { response }

#   # describe '' do
    
#   # end

#   # describe "when the image api is used" do
#   #   it "is expected to have a category of image" do
#   #     expect(response_json["category"]).to eq "image"
#   #   end
#   # end

#   describe 'when there are no images in the database' do
#     it { is_expected.to have_http_status 200 }
#   end

#   #   it 'is expected to respond with a message' do
#   #     expect(response_json['message']).to eq 'There are no images'
#   #   end
#   # end
# end
