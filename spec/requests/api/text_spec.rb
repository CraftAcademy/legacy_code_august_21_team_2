RSpec.describe "POST /api/analyses", type: :request do
  let(:expected_response) do
    JSON.parse(file_fixture("text_response.json").read)
  end

  let(:params) do
    { analysis: {
      resource: "I fucking love eating corndogs",
      category: "text",
    } }
  end

  describe "when the text api is used" do
    before do
      stub_request(:post, "https://api.monkeylearn.com/v3/classifiers/cl_KFXhoTdt/classify/")
        .with(
          body: "{\"data\":[\"I fucking love eating corndogs\"]}",
        )
        .to_return(status: 200, body: expected_response)
      post "/api/analyses", params: params
    end

    #   it { is_expected.to have_http_status 200 }

    it "is expected to have a category of text" do
      expect(response_json["category"]).to eq "text"
    end

    it "is expected to return a profanity response" do
      expect(eval(response_json["results"]["classifications"])[0]["tag_name"]).to eq "profanity"
    end
  end
end
