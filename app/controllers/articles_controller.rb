class ArticlesController < ApplicationController
  before_action :fill_articles

  def index
    articles ||= Article.order_by_title.order_by_published
    render json: articles.to_json, status: :ok
  end

  private

  def fill_articles
    query = 'tesla'   # should I get from env?
    from = 1.month.ago.to_date.to_s # should I get from env?
    has_articles ||= Article.count
    GetData.new(query, from).articles if has_articles.zero? || has_articles < 20
  end
end
