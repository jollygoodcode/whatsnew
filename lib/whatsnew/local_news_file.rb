require "pathname"

module Whatsnew
  class LocalNewsFile
    def initialize(news, path)
      @news = news
      @path = path
    end

    def file_name
      @file_name ||= file.basename.to_s
    end

    def file_url
      return NOT_FOUND unless news
      return file.to_path unless File.exist?(File.join(path, DOT_GIT))

      "https://#{matched[:host]}/#{matched[:owner]}/#{matched[:repo]}/blob/master/#{file_name}"
    end

    def content
      file.read
    end

    def read
      "What's New:\n" "See #{file_name}: #{file_url}."
    end

    private

      attr_reader :news, :path

      def file
        @file ||= Pathname(news)
      end

      def matched
        @matched ||= matched_from_git_config
      end

      def matched_from_git_config
        Dir.chdir(Pathname(path).to_path) do
          `git config --get remote.origin.url`.match(
            %r{(http://|https://|git.+)(?<host>(github.com|bitbucket.com|bitbucket.org))[:/](?<owner>\S+)/(?<repo>\S+)\.git}
          )
        end
      end
  end
end
