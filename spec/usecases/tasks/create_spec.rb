# frozen_string_literal: true

require 'spec_helper'
require './app/models/task'
require './app/adapters/repositories/user_repository'
require './app/adapters/repositories/task_repository'
require './app/usecases/tasks/create'

RSpec.describe Tasks::Create do
  context '.call' do
    it 'should create a task' do
      user = UserRepository.create!(name: 'Jhon', email: 'jhon@email.com')
      dead_line = '01/01/2001'
      params = {
        name: 'Introduction',
        dead_line: dead_line,
        user_id: user.id
      }

      create_task = Tasks::Create.new(params: params)

      expect { create_task.call }.to change(TaskRepository, :count).by(1)
      task = TaskRepository.last
      expect(task.name).to eq 'Introduction'
      date = task.dead_line.strftime('%d/%m/%Y')
      expect(date).to eq dead_line
      expect(task.user_id).to eq user.id
    end
  end
end
