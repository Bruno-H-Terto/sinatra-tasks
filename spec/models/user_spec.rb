require 'spec_helper'
require './app/models/user'

RSpec.describe User do
  context '.new' do
    it 'should register a name and email' do
      user = User.new(name: 'Jhon', email: 'jhon@email.com')

      expect(user.name).to eq 'Jhon'
      expect(user.email).to eq 'jhon@email.com'
    end
  end

  context '#attributes' do
    it 'should return a hash with attributes' do
      user = User.new(name: 'Jhon', email: 'jhon@email.com')
      hash = { name: 'Jhon', email: 'jhon@email.com' }

      expect(user.attributes).to eq hash
    end
  end
end
