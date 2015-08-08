require "pathname"

module Whatsnew
  class Project
    def initialize(path)
      @path = path
      @name = Dir.glob(File.join(path, "*")).find do |file|
        file =~ %r[(CHANGE|CHANGES|CHANGELOG|NEWS|HISTORY)]
      end
    end

    def news_file
      NewsFile.new(@name, project_uri)
    end

    # git@github.com:jollygoodcode/whatsnew.git
    # => https://github.com:jollygoodcode/whatsnew
    def project_uri
      if matched = matched_from_git_repository
        "https://#{matched[:host]}/#{matched[:owner]}/#{matched[:repo]}"
      else
        "NOT FOUND"
      end
    end

    private

      def matched_from_git_repository
        Dir.chdir(Pathname(@path).to_path) do
          `git config --get remote.origin.url`.match(
            %r{git.+(?<host>(github.com|bitbucket.com|bitbucket.org))[:/](?<owner>\S+)/(?<repo>\S+)\.git}
          )
        end
      end
  end
end
