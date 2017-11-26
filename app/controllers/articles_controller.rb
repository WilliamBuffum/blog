class ArticlesController < ApplicationController

  # defines action to 'show' article.
  # 'bin/rails route' shows that this route is on
  # 'article  GET /articles/:id(.:format)  articles#show'
  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  private
    # have to require and permit parameters
    # to 'whitelist' them
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
