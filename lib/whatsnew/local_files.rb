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
        NewsFile.new(Pathname(news).basename.to_s, project_uri: project_uri)
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
  end
end
