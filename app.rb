# frozen_string_literal: true

require 'sinatra'
require './lib/bookmark'

# main controller class object
class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks/delete' do
    Bookmark.delete(id: params[:id])

    redirect '/bookmarks'
  end

  get '/bookmarks/update' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/update'
  end

  post '/bookmarks/update' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
