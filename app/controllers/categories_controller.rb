class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
  @pagy, @categories = pagy(Category.all)

    if params[:search].present?
      @search_category = Category.searched(params[:search])

      respond_to do |format|
        format.js
      end
    else
    end  
 
  end
  
  def new
    @category = Category.new

    # Admin authorization
    authorize @category
  end
   
  def create
    @category = current_user.categories.new(category_params)
   
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: "Category was successfully created." }
        format.json { render :index, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def edit
    @category = Category.find(params[:id])

    # Admin authorization
    authorize @category
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path, notice: "Category was successfully updated." }
        format.json { render :index, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])

    # Admin authorization
    authorize @category

    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit( :disease_id, :medicine_id, :name)
    end
end

