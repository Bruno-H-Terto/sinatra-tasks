# frozen_string_literal: true

require './app/usecases/tasks/create'

class TaskController
  def self.create(**params)
    Tasks::Create.new(params: params).call
  end
end
