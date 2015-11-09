require "octokit"

module Whatsnew
  class RemoteFiles
    def initialize(repo, access_token = nil)
      @repo = repo
      @token =
        access_token ||
        ENV.fetch("OAUTH_ACCESS_TOKEN") { prints_no_token_warning }

      if token && token.size != 40
        abort "ERROR: OAuth token should be 40-char long.".freeze
      end
    end

    def to_news_file
      if contents = find_from_contents
        NewsFile.new(contents)
      elsif releases = find_from_releases
        ReleaseFile.new(releases)
      else
        NoNewsFile.new
      end
    rescue Octokit::NotFound
      NoNewsFile.new
    rescue Octokit::Unauthorized
      abort "ERROR: Your OAuth token: #{token} is invalid or revoked."
    end

    private

      attr_reader :repo, :token

      def prints_no_token_warning
        puts "WARNING: No OAuth token is provided.".freeze
      end

      def client
        @client ||= Octokit::Client.new(access_token: token)
      end

      def find_from_contents
        if resources = client.contents(repo)
          resources.find do |resource|
            resource.name =~ FILES_TO_SEARCH_REGEXP
          end
        end
      end

      def find_from_releases
        if resources = client.releases(repo)
          resources.find do |release|
            release.respond_to?(:body) && !release.body.empty?
          end
        end
      end
  end
end
