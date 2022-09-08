require 'rails_helper'

RSpec.describe 'the manager request' do
  it 'returns json when given valid data' do
    data = {
      "name": "Han Solo",
      "email": "h-sol@testmail.com",
      "password": "1234",
      "password_confirmation": "1234"
    }
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

    post '/api/v1/managers', headers: headers, params: JSON.generate(data) 

    manager = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(201)
    expect(manager[:data]).to have_key(:type)
    expect(manager[:data]).to have_key(:id)
    expect(manager[:data]).to have_key(:attributes)
    expect(manager[:data][:attributes]).to have_key(:name)
    expect(manager[:data][:attributes]).to have_key(:email)
    expect(manager[:data][:attributes]).to_not have_key(:password)
    expect(manager[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  it 'returns an error message if name is blank' do 
    data = {
      "name": "",
      "email": "test@testmail.com",
      "password": "1234",
      "password_confirmation": "1234"
    }
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

    post '/api/v1/managers', headers: headers, params: JSON.generate(data) 
    
    
    manager = JSON.parse(response.body, symbolize_names: true)
    expect(manager).to have_key(:data)
    expect(manager[:data]).to have_key(:message)
    expect(manager[:data][:message]).to eq("All fields must be filled in")
  end 

  it 'returns an error message if password is blank' do 
    data = {
      "name": "Dudley Dooright",
      "email": "dudley@testmail.com",
      "password": "",
      "password_confirmation": "1234"
    }
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

    post '/api/v1/managers', headers: headers, params: JSON.generate(data) 
    
    
    manager = JSON.parse(response.body, symbolize_names: true)
    expect(manager).to have_key(:data)
    expect(manager[:data]).to have_key(:message)
    expect(manager[:data][:message]).to eq("All fields must be filled in")
  end 
end
