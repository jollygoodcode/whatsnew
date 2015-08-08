require "pathname"

module Whatsnew
  class NewsFile
    attr_reader :file_url

    def initialize(path, project_uri)
      @newsfile = Pathname(path)
      @file_url = "#{project_uri}/blob/master/#{file_name}"
    end

    def content
      "What's New:\n" "See #{file_name}: #{file_url}."
    end

    def file_name
      newsfile.basename.to_s
    end

    private

      attr_reader :newsfile
  end
end
