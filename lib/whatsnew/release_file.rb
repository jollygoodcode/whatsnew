require "pathname"

module Whatsnew
  class ReleaseFile
    def initialize(release)
      @release = release
    end

    def file_name
      "Releases".freeze
    end

    def file_url
      release_html_url
    end

    def content
      "See #{file_url}."
    end

    def read
      "What's New:\n" "See #{file_name}: #{file_url}."
    end

    private

      attr_reader :release

      def release_html_url
        release.html_url.sub(%r(/releases/.+), "/releases".freeze)
      end
  end
end
