module Whatsnew
  class RemoteFiles
    def initialize(resources)
      @news = resources.find do |resource|
        resource.name =~ %r{(CHANGE|CHANGES|CHANGELOG|NEWS|HISTORY)}i.freeze
      end
    end

    def to_news_file
      if news
        NewsFile.new(news.name, file_url: news.html_url)
      else
        NoNewsFile.new
      end
    end

    private

      attr_reader :news
  end
end
