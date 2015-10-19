require 'rails_helper'

RSpec.describe 'AuthObject endpoints', type: :request do

  before do
    @headers = {'Content-Type' => 'Application/JSON'}
    @application = Application.create(name: 'test_app', api_key: SecureRandom.hex(16), domain: 'test_app.com')
  end

  describe 'POST /api/v1/auth_objects/' do
    it 'creates new auth_object' do
      post '/api/v1/auth_objects/', auth_objects_request_body.to_json, @headers
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json.length).to eq(9)
      expect(AuthObject.all.count).to eq(1)
      expect(AuthObject.first).to be
      expect(json.keys).to include('permissions', 'content_id', 'content_type', 'domain')
    end
  end

  private

  def auth_objects_request_body
    {
      api_key: @application.api_key,
      content_id: '7',
      content_type: 'link',
      email: 'me@example.org',
      permissions: 'rwx'
    }
  end
end