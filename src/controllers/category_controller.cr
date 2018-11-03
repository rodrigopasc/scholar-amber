class CategoryController < ApplicationController
  getter category = Category.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_category }
  end

  def index
    categories = Category.all
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
    category = Category.new category_params.validate!
    if category.save
      redirect_to action: :index, flash: {"success" => "Created category successfully."}
    else
      flash["danger"] = "Could not create Category!"
      render "new.slang"
    end
  end

  def update
    category.set_attributes category_params.validate!
    if category.save
      redirect_to action: :index, flash: {"success" => "Updated category successfully."}
    else
      flash["danger"] = "Could not update Category!"
      render "edit.slang"
    end
  end

  def destroy
    category.destroy
    redirect_to action: :index, flash: {"success" => "Deleted category successfully."}
  end

  private def category_params
    params.validation do
      required :description { |f| !f.nil? }
    end
  end

  private def set_category
    @category = Category.find! params[:id]
  end
end
