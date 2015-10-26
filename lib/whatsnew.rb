require "whatsnew/version"
require "whatsnew/constants"

require "whatsnew/no_news_file"

require "whatsnew/local_news_file"
require "whatsnew/local_files"

require "whatsnew/news_file"
require "whatsnew/release_file"
require "whatsnew/remote_files"

require "whatsnew/project"

module Whatsnew
  def self.about(path_or_resources)
    Project.new(path_or_resources).news_file
  end
end
