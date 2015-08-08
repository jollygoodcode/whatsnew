require "pathname"

module Whatsnew
  class Project
    attr_reader :news_file

    def initialize(path)
      @path = path
      @news_file = get_news_file_from_path
    end

    def get_news_file_from_path
      if path_is_a_sawyer_resource_array
        RemoteNewsFile.new(path)
      else
        if news_file_name
          NewsFile.new(news_file_name, project_uri)
        else
          NoNewsFile.new
        end
      end
    end

    # git@github.com:jollygoodcode/whatsnew.git
    # => https://github.com:jollygoodcode/whatsnew
    def project_uri
      if matched = matched_from_git_repository
        "https://#{matched[:host]}/#{matched[:owner]}/#{matched[:repo]}"
      else
        "NOT FOUND".freeze
      end
    end

    private

      attr_reader :path

      def path_is_a_sawyer_resource_array
        path.is_a?(Array) && path.first.is_a?(Sawyer::Resource)
      end

      def news_file_name
        @news_file_name ||= Dir.glob(File.join(path, "*".freeze)).find do |file|
          file =~ %r{(CHANGE|CHANGES|CHANGELOG|NEWS|HISTORY)}i.freeze
        end
      end

      def matched_from_git_repository
        Dir.chdir(Pathname(path).to_path) do
          `git config --get remote.origin.url`.match(
            %r{git.+(?<host>(github.com|bitbucket.com|bitbucket.org))[:/](?<owner>\S+)/(?<repo>\S+)\.git}
          )
        end
      end
  end
end
