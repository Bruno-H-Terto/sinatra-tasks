# frozen_string_literal: true

class User
  attr_reader :name, :email

  def initialize(name:, email:)
    @name = name
    @email = email
  end

  def attributes
    instance_variables.each_with_object({}) do |var, hash|
      hash[var.to_s.delete('@').to_sym] = instance_variable_get(var)
    end
  end
end
