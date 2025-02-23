# frozen_string_literal: true

require 'spec_helper'
require './app/models/user'
require './app/adapters/repositories/user_repository'
require './app/usecases/users/create'

RSpec.describe Users::Create do
  context '.call' do
    it 'should create an user' do
      params = {
        name: 'Jhon',
        email: 'jhon@email.com'
      }
      create_user = Users::Create.new(params: params)

      expect { create_user.call }.to change(UserRepository, :count).by(1)
      expect(create_user.call).to eq(UserRepository.last)
    end
  end
end
