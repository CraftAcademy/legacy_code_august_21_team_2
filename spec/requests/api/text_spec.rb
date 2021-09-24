RSpec.describe 'POST /api/analyses', type: :request do
  let(:expected_response_profanity) do
    JSON.parse(file_fixture('text_response_profanity.json').read)
  end

  let(:expected_response_clean) do
    JSON.parse(file_fixture('text_response_clean.json').read)
  end

  let(:params_profanity) do
    { analysis: {
      resource: 'I fucking love eating corndogs',
      category: 'text'
    } }
  end

  let(:params_clean) do
    { analysis: {
      resource: 'Lets go swimming',
      category: 'text'
    } }
  end

  describe 'when the text api is used' do
    before do
      stub_request(:post, 'https://api.monkeylearn.com/v3/classifiers/cl_KFXhoTdt/classify/')
        .with(
          body: '{"data":["I fucking love eating corndogs"]}'
        )
        .to_return(status: 200, body: expected_response_profanity)
      post '/api/analyses', params: params_profanity
    end

    #   it { is_expected.to have_http_status 200 }

    it 'is expected to have a category of text' do
      expect(response_json['category']).to eq 'text'
    end

    it 'is expected to return a profanity response' do
      expect(eval(response_json['results']['classifications'])[0]['tag_name']).to eq 'profanity'
    end
  end

  describe 'when the text api is used' do
    before do
      stub_request(:post, 'https://api.monkeylearn.com/v3/classifiers/cl_KFXhoTdt/classify/')
        .with(
          body: '{"data":["Lets go swimming"]}'
        )
        .to_return(status: 200, body: expected_response_clean)

      post '/api/analyses', params: params_clean
    end

    it 'is expected to return a clean response' do
      expect(eval(response_json['results']['classifications'])[0]['tag_name']).to eq 'clean'
    end
  end
end
