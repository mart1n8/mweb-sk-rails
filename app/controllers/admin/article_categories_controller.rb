class Admin::ArticleCategoriesController < ApplicationController
  before_action :set_article_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/article_categories
  # GET /admin/article_categories.json
  def index
    @article_category = ArticleCategory.new
    @article_categories = ArticleCategory.all
  end

  # GET /admin/article_categories/1/edit
  def edit
  end

  # POST /admin/article_categories
  # POST /admin/article_categories.json
  def create
    @article_category = ArticleCategory.new(article_category_params)

    respond_to do |format|
      if @article_category.save
        flash[:notice] = "Kategória článkov bola pridaná."
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render :show, status: :created, location: @article_category }
      else
        format.html { render :new }
        format.json { render json: @article_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/article_categories/1
  # PATCH/PUT /admin/article_categories/1.json
  def update
    respond_to do |format|
      if @article_category.update(article_category_params)
        flash[:notice] = "Kategória článkov bola upravená."
        format.html { redirect_to admin_edit_article_category_path(@article_category) }
        format.json { render :show, status: :ok, location: @article_category }
      else
        format.html { render :edit }
        format.json { render json: @article_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/article_categories/1
  # DELETE /admin/article_categories/1.json
  def destroy
    @article_category.destroy
    respond_to do |format|
      flash[:notice] = "Kategória článkov bola vymazaná."
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_category
      @article_category = ArticleCategory.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_category_params
      params.require(:article_category).permit(:name, :slug, :logo)
    end
end
