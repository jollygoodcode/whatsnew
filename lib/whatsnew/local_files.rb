require "pathname"

module Whatsnew
  class LocalFiles
    def initialize(path)
      @path = path
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
        Dir.glob(File.join(path, "*".freeze)).find do |local_file|
          local_file =~ %r{(CHANGE|CHANGES|CHANGELOG|NEWS|HISTORY)}i.freeze
        end
      end
  end
end
