class Admin::PostsController < ApplicationController
   before_filter :set_body_class

   def index
      @posts = Post.all
   end

   def show
      @bodyClass = 'post-template'
      @post = Post.find(params[:id])
   end

   def new
      @post = Post.new
      @statuses = Post.getStatusOptions()
   end

   def edit
      @post = Post.find(params[:id])
      @statuses = Post.getStatusOptions()
   end

   def update
      @post = Post.find(params[:id])

      if @post.update_attributes(post_params)
         redirect_to(admin_posts_path)
      else
         redirect_to(:back)
      end
   end

   def create
      post = Post.new(post_params)
      post.save
      if post.save
         redirect_to(admin_posts_path)
      else
         redirect_to(:back)
      end
   end

private
   # http://stackoverflow.com/questions/16109118/virtual-attributes-in-rails-4
   def post_params
      params.require(:post).permit(:title, :content, :status, :tags_list)
   end

   def set_body_class
      @bodyClass = 'home-template'
   end
end
