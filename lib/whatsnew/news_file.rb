require "pathname"

module Whatsnew
  class NewsFile
    def initialize(path, project_uri)
      @filename = Pathname(path).basename
      @file_url = "#{project_uri}/blob/master/#{@filename}"
    end

    def content
      "What's New:\n" "See #{filename}: #{file_url}."
    end

    private

      attr_reader :filename, :file_url
  end
end
