class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :delete]
  access [:all, :user] => [:show, :index], [:editor, :admin] => [:all]

  # GET /articles
  def index
    @articles = Article.includes(:article_category, :user).order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end

  # GET /articles
  def adminList
    @articles = Article.includes(:article_category, :user).paginate(page: params[:page], per_page: 20)
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    respond_to do |format|
      if @article.save
        flash[:notice] = "Článok bol pridaný."
        format.html { redirect_to article_path(@article) }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.includes(:article_category, :user).friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :article_category_id, :tags, :intro_text, :text)
    end
end
