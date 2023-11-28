class GetData
  include HTTParty
  base_uri ENV['API_NEWS_URL']
  SORT_BY = 'publishedAt'.freeze
  API_KEY = ENV['NEWSAPI_KEY']

  def initialize(query, from)
    @options = { query: { q: query, from: from, sortBy: SORT_BY, apiKey: API_KEY } }
  end

  def articles
    begin
      articles = self.class.get('/everything', @options)['articles']
      articles.each do |article|
        create_article(article)
      end
    rescue => e
      Rails.logger.error "SOMETHING GET WRONG #{e.message}"
    end
  end

  private

  def create_article(article)
    Article.create(
      title: article['title'],
      author: article['author'],
      description: article['title'],
      url: article['url'],
      url_to_image: article['urlToImage'],
      published_at: article['publishedAt'],
      content: article['content']
    )
  end
end


# query = 'tesla' 
# from = 1.month.ago.to_date.to_s

# call api news 
# GetData.new(query, from).articles
