require "pathname"

module Whatsnew
  class NoNewsFile
    NOT_FOUND = "NOT FOUND".freeze

    def content
      NOT_FOUND
    end

    def file_name
      NOT_FOUND
    end

    def file_url
      NOT_FOUND
    end
  end
end
