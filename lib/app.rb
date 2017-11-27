require 'sinatra/base'
require 'resque'
require_relative './db/connection'
require_relative './task/update_status'

Resque.redis = ENV['REDIS']

class App < Sinatra::Base
  enable :logging

  get '/' do
    'hello world'
  end

  get '/posts' do
    posts = Post.order(Sequel.desc(:id)).all
    erb :posts, locals: {posts: posts}
  end

  post '/posts' do
    post = params[:post]
    post[:status] = 'POSTED'

    post = Post.create(post)

    Resque.enqueue(UpdateStatus, post.id)

    redirect to('/posts')
  end

  run! if app_file == $0
end