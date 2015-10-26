require "pathname"

module Whatsnew
  class NoNewsFile
    def file_name
      NOT_FOUND
    end

    def file_url
      NOT_FOUND
    end

    def content
      EMPTY_STRING
    end

    def read
      NOT_FOUND
    end
  end
end
