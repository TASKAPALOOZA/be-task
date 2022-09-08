

require 'rails_helper'

RSpec.describe 'the manager request' do
  it 'returns json when given valid data' do
    data = {
      "name": "Han Solo",
      "email": "h-sol@testmail.com",
      "password": "1234",
      "password_confirmation": "1234"
    }

    post '/api/v1/managers', params: data 

    manager = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data[:attributes]]).to have_key(:name)
    expect(user[:data[:attributes]]).to have_key(:email)
    expect(user[:data[:attributes]]).to_not have_key(:password)
    expect(user[:data[:attributes]]).to_not have_key(:password_confirmation)
  end
end
