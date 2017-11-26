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

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new' # directs to the new action above
    end
  end

  private
    # have to require and permit parameters
    # to 'whitelist' them
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
