module Whatsnew
  class NewsFile
    def initialize(news)
      @news = news
    end

    def file_name
      news.name
    end

    def file_url
      news_html_url
    end

    def content
      "See #{file_url}."
    end

    def read
      "What's New:\n" "See #{file_name}: #{file_url}."
    end

    private

      attr_reader :news

      def news_html_url
        news.html_url
      end
  end
end
