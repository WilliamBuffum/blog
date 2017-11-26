class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  # defines action to 'show' article.
  # 'bin/rails route' shows that this route is on
  # 'article  GET /articles/:id(.:format)  articles#show'
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    # save method on @article creates new record
    if @article.save
      redirect_to @article
    else
      render 'new' # directs to the new action above
    end
  end

  def update
    @article = Article.find(params[:id])

    # update method on @article updates record
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private
    # have to require and permit parameters
    # to 'whitelist' them
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
