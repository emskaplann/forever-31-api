class ChildCategoriesController < ApplicationController
  before_action :set_child_category, only: [:show, :update, :destroy]

  # GET /child_categories
  def index
    @child_categories = ChildCategory.all

    render json: @child_categories
  end

  # GET /child_categories/1
  def show
    render json: @child_category
  end

  # POST /child_categories
  def create
    @child_category = ChildCategory.new(child_category_params)

    if @child_category.save
      render json: @child_category, status: :created, location: @child_category
    else
      render json: @child_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /child_categories/1
  def update
    if @child_category.update(child_category_params)
      render json: @child_category
    else
      render json: @child_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /child_categories/1
  def destroy
    @child_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child_category
      @child_category = ChildCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def child_category_params
      params.require(:child_category).permit(:category_id, :name, :gender, :image_path)
    end
end
