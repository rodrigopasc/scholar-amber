class PostController < ApplicationController
  getter post = Post.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_post }
  end

  def index
    posts = Post.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    post = Post.new post_params.validate!
    if post.save
      redirect_to action: :index, flash: {"success" => "Created post successfully."}
    else
      flash["danger"] = "Could not create Post!"
      render "new.slang"
    end
  end

  def update
    post.set_attributes post_params.validate!
    if post.save
      redirect_to action: :index, flash: {"success" => "Updated post successfully."}
    else
      flash["danger"] = "Could not update Post!"
      render "edit.slang"
    end
  end

  def destroy
    post.destroy
    redirect_to action: :index, flash: {"success" => "Deleted post successfully."}
  end

  private def post_params
    params.validation do
      required :category_id { |f| !f.nil? }
      required :title { |f| !f.nil? }
      required :content { |f| !f.nil? }
    end
  end

  private def set_post
    @post = Post.find! params[:id]
  end
end
