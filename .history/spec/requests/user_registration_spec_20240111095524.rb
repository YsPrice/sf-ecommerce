require 'rails_helper'

RSpec.describe 'Auth', type: :request do
  it 'allows user registration' do
    post '/auth', params: {
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123',
      confirm_success_url: 'http://localhost:3000/' # this can be any URL
    }, as: :json

    response_body = JSON.parse(response.body)
    puts response_body  # Print the parsed response body
    expect(response_body['errors']).to be_nil # Example of checking a specific attribute
    expect(response).to have_http_status(:ok)
  end
end