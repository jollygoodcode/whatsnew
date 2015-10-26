module Whatsnew
  class Project
    attr_reader :news_file

    def initialize(path_or_resources)
      @path_or_resources = Array(path_or_resources)
    end

    def news_file
      if resources?
        RemoteFiles.new(path_or_resources).to_news_file
      else
        LocalFiles.new(path_or_resources).to_news_file
      end
    end

    private

      attr_reader :path_or_resources

      def resources?
        path_or_resources &&
        path_or_resources.respond_to?(:find) &&
        path_or_resources.first.respond_to?(:name) &&
        path_or_resources.first.respond_to?(:html_url)
      end
  end
end
