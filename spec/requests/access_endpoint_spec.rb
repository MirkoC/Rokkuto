require 'rails_helper'

RSpec.describe 'Access endpoints', type: :request do

  before do
    @headers = {'Content-Type' => 'Application/JSON'}
    @application = create(:application)
    @user = create(:user)
    @auth_object = create(:auth_object, application_id: @application.id, user_token: @user.token)
  end

  describe 'POST /api/v1/access/' do
    it 'creates new auth_objects and gives requested access rights to the original auth_object' do
      post '/api/v1/access/', access_request_body.to_json, @headers
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['auth_objects'].length).to eq(3)
      json['auth_objects'].each do |ao|
        expect(ao.keys).to include('permissions', 'content_id', 'content_type', 'domain')
      end
      expect(AuthObject.all.count).to eq(4)
    end
  end

  describe 'GET /api/v1/access/:token/?api_key=:api_key' do
    it 'returns auth object if token is valid, i.e. requested url has access rights' do
      get "/api/v1/access/#{@auth_object.token}/?api_key=#{@application.api_key}"
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json.length).to eq(9)
      expect(AuthObject.all.count).to eq(1)
      expect(AuthObject.first).to be
      expect(json.keys).to include('permissions', 'content_id', 'content_type', 'domain')
    end
  end

  private

  def access_request_body
    {
      api_key: @application.api_key,
      content_id: '7',
      content_type: 'link',
      email: 'me@example.org',
      to: { 'other@example.org': 'rw',
            'someone@example.org': 'rwx',
            'other_someone@example.org': 'r' }
    }
  end
end