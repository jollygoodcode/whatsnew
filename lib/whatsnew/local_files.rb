module Whatsnew
  class LocalFiles
    def initialize(path)
      @path = path || DOT
    end

    def to_news_file
      if news = find_news_at_local
        LocalNewsFile.new(news, path)
      else
        NoNewsFile.new
      end
    end

    private

      attr_reader :path

      def find_news_at_local
        Dir.glob(File.join(path, STAR)).find do |local_file|
          local_file =~ FILES_TO_SEARCH_REGEXP
        end
      end
  end
end
