# frozen_string_literal: true

require './app/models/task'
require './app/adapters/repositories/task_repository'
require './app/adapters/repositories/user_repository'
require 'byebug'

module Tasks
  class Create
    def initialize(params:, task: Task, task_repository: TaskRepository)
      @params = params
      @task = task
      @task_repository = task_repository
    end

    def call
      task = @task.new(name: @params[:name], dead_line: @params[:dead_line], user_id: @params[:user_id])
      @task_repository.create!(task.attributes)
    end
  end
end
