require "pathname"

module Whatsnew
  class NoNewsFile
    NOT_FOUND = "NOT FOUND".freeze

    def file_name
      NOT_FOUND
    end

    def file_url
      NOT_FOUND
    end

    def read
      NOT_FOUND
    end

    def content
      "".freeze
    end
  end
end
