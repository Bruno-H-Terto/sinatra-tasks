# frozen_string_literal: true

class Task
  attr_reader :name, :dead_line, :user_id

  def initialize(name:, dead_line:, user_id:)
    @name = name
    @dead_line = dead_line
    @user_id = user_id
  end

  def attributes
    instance_variables.each_with_object({}) do |var, hash|
      hash[var.to_s.delete('@').to_sym] = instance_variable_get(var)
    end
  end
end
