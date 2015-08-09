require "pathname"

module Whatsnew
  class LocalFiles
    def initialize(path)
      @path = path
      @news = Dir.glob(File.join(path, "*".freeze)).find do |file|
        file =~ %r{(CHANGE|CHANGES|CHANGELOG|NEWS|HISTORY)}i.freeze
      end
    end

    def to_news_file
      if news
        NewsFile.new(
          file_name,
          content: file.read,
          file_url: "#{project_uri}/blob/master/#{file_name}"
        )
      else
        NoNewsFile.new
      end
    end

    private

      attr_reader :path, :news, :matched

      def project_uri
        if File.exist?("#{path}/.git") && matched_from_git_config
          "https://#{matched[:host]}/#{matched[:owner]}/#{matched[:repo]}"
        else
          "NOT FOUND".freeze
        end
      end

      def matched_from_git_config
        @matched ||= Dir.chdir(Pathname(path).to_path) do
          `git config --get remote.origin.url`.match(
            %r{git.+(?<host>(github.com|bitbucket.com|bitbucket.org))[:/](?<owner>\S+)/(?<repo>\S+)\.git}
          )
        end
      end

      def file
        @file ||= Pathname(news)
      end

      def file_name
        @file_name ||= file.basename.to_s
      end
  end
end
