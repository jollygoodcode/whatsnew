require "pathname"

module Whatsnew
  class NewsFile
    attr_reader :file_name, :file_url

    def initialize(file_name, project_uri: nil, file_url: nil)
      @file_name = file_name
      @file_url = file_url || "#{project_uri}/blob/master/#{file_name}"
    end

    def read
      "What's New:\n" "See #{file_name}: #{file_url}."
    end
  end
end
