RSpec.describe 'POST /api/analyses', type: :request do
   describe 'when the text api is used' do
    before do
     stub_request('https://api.monkeylearn.com/v3/classifiers/cl_KFXhoTdt/classify/')
     .with(body: 'I fucking love eating corndogs').to_return(status: 200, body: expected_response)
     post '/api/analyses', params: params
    end
   end

end
  