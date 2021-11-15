RSpec.describe 'POST /api/analyses', type: :request do
  let(:expected_response) do
    JSON.parse(file_fixture('image_response.json').read)
  end

  let(:params) do
    { analysis: {
      resource: 'https://www.tress.com/products/billeder_fra_tress/900pixel/656022.jpg',
      category: 'image'
    } }
  end

  subject { response }

  describe 'when the image api is used' do
    before do
      stub_request(:post, 'https://api.clarifai.com/v2/models/d16f390eb32cad478c7ae150069bd2c6/outputs')
        .with(
          body: '{"inputs":[{"data":{"image":{"url":"https://www.tress.com/products/billeder_fra_tress/900pixel/656022.jpg"}}}]}'
        )
        .to_return(status: 200, body: expected_response)
      post '/api/analyses', params: params
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected to have a category of image' do
      expect(response_json['category']).to eq 'image'
    end

    it 'is expected to display result percentages of image' do
      expect(response_json['results']['safe'].to_f).to eq 0.9999896
      expect(response_json['results']['gore'].to_f).to eq 5.203112e-06
      expect(response_json['results']['suggestive'].to_f).to eq 4.575949e-06
      expect(response_json['results']['explicit'].to_f).to eq 2.9322536e-07
      expect(response_json['results']['drug'].to_f).to eq 1.9213473e-07
    end
  end
end
