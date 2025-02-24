# frozen_string_literal: true

require 'spec_helper'
require './app/models/task'
require './app/adapters/repositories/user_repository'
require './app/usecases/users/create'

RSpec.describe Task do
  context '.new' do
    it 'should register a task' do
      user = User.new(name: 'Jhon', email: 'jhon@email.com')
      dead_line = 7.days.from_now
      user_registred = UserRepository.create!(user.attributes)
      task = Task.new(name: 'Introduction', dead_line: dead_line, user_id: user_registred.id)

      expect(task.name).to eq 'Introduction'
      expect(task.dead_line).to eq dead_line
      expect(task.user_id).to eq user_registred.id
    end
  end

  context '#attributes' do
    it 'should return a hash with attributes' do
      dead_line = '2025-01-01'
      task = Task.new(name: 'Introduction', dead_line: dead_line, user_id: 1)
      hash = { name: 'Introduction', dead_line: dead_line, user_id: 1 }

      expect(task.attributes).to eq hash
    end
  end
end
