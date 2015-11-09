module Whatsnew
  class Project
    attr_reader :news_file

    def initialize(path_or_repo, access_token = nil)
      @path_or_repo = path_or_repo
      @access_token = access_token
    end

    def news_file
      return LocalFiles.new(path_or_repo).to_news_file unless path_or_repo

      if query_for_a_repo?
        RemoteFiles.new(path_or_repo, access_token).to_news_file
      else
        LocalFiles.new(path_or_repo).to_news_file
      end
    end

    private

      attr_reader :path_or_repo, :access_token

      def query_for_a_repo?
        path_or_repo.count("/".freeze) == 1 &&
        path_or_repo =~ %r(^.+/.+$).freeze
      end
  end
end
