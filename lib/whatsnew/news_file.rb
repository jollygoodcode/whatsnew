require "pathname"

module Whatsnew
  class NewsFile
    attr_reader :file_name, :content, :file_url

    def initialize(file_name, content: nil, file_url: nil)
      @file_name = file_name
      @content = content
      @file_url = file_url
    end

    def read
      "What's New:\n" "See #{file_name}: #{file_url}."
    end
  end
end
