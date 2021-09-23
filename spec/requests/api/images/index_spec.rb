RSpec.describe "POST /api/analyses", type: :request do
  let(:expected_response) do
    file_fixture("image_response.json").read
  end
  
  let(:params) do
    params = { analysis: {
      resource: 'https://www.momentsandthings.se/wp-content/uploads/2016/06/Gunga-ek-med-namn.jpg',
      category: 'image'
      }}
  end
 
  subject { response }

  describe 'when the image api is used' do
    before do
      stub_request(:post,
                   "https://safe-for-work-api.herokuapp.com/api/analyses").to_return(
        body: expected_response,
      )
      post "/api/analyses", params: params
    end

    it "is expected to have a category of image" do
      expect(response_json["category"]).to eq "image"
    end
  end

end

  # describe 'when there are no images in the database' do
  #   it { is_expected.to have_http_status 200 }
  # end

  #   it 'is expected to respond with a message' do
  #     expect(response_json['message']).to eq 'There are no images'
  #   end
  # end
