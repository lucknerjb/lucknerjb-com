class PagesController < ApplicationController
   def index
      @posts = Post.where(:status => 'published')
   end

   def about
   end

   def post
      identifier = params[:path].split('-').first
      @post = Post.where(identifier: identifier).first

      render '404' unless @post
   end
end
