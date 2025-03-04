# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv'
Dotenv.load
require './app/adapters/controllers/user_controller'
require './app/adapters/controllers/task_controller'

set :database, { adapter: 'sqlite3', database: ENV.fetch('DB_PATH', nil) }

post '/users' do
  { response: UserController.create(**params) }.to_json
end

post '/tasks' do
  { response: TaskController.create(**params) }.to_json
end
