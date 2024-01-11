require 'rails_helper'

RSpec.describe 'User Registration', type: :request do
  let(:user_params) do
    {
      email: 'megaman@gmail.com',
      password: 'megaman',
      password_confirmation: 'megaman',
      confirm_success_url: 'http://localhost:3000/user/confirmation' # Adjust this URL as needed

    }
  end

  it 'registers a new user' do
    post '/auth', params: user_params, as: :json

    expect(response).to have_http_status(200) # Use the correct expected status
    expect(response.body).to include('auth_token') # Check if the auth token is present in response
    response_body = JSON.parse(response.body)
  expect(response_body['errors']).not_to be_empty  # Check if there are errors
  puts response_body['errors']  # Print the errors
  end
end
