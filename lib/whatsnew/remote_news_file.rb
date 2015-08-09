require "pathname"

module Whatsnew
  class RemoteNewsFile
    def initialize(sawyer_resources)
      @news_resource = sawyer_resources.find do |resource|
        resource.name =~ %r{(CHANGE|CHANGES|CHANGELOG|NEWS|HISTORY)}i.freeze
      end
    end

    def content
      "What's New:\n" "See #{file_name}: #{file_url}."
    end

    def file_name
      news_resource.name
    end

    def file_url
      news_resource.html_url
    end

    private

      attr_reader :news_resource
  end
end
