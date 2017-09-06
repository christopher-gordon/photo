class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    post_params = params[:post]

    if Post.create(post_params)
      flash[:notice] = "You have successfully added this blog post!"
      redirect_to admin_index_path
    else
      flash[:error] = "There was an error adding the blog post!  Please try again."
      redirect_to new_post_path
    end
  end
end
