# spec/requests/auth_spec.rb
require 'rails_helper'

RSpec.describe 'Auth', type: :request do
  it 'allows user registration' do
    post '/auth', params: {
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123',
      confirm_success_url: 'http://localhost:3000/' # this can be any URL
    }, as: :json

    expect(response).to have_http_status(:ok) # Or :created, depending on your config
  end
end
